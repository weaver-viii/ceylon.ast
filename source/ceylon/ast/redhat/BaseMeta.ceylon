import ceylon.ast.core {
    BaseMeta,
    MemberName,
    MemberNameWithTypeArguments,
    TypeArguments
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JFunctionLiteral=FunctionLiteral,
        JMemberLiteral=MemberLiteral,
        JStaticType=StaticType,
        JType=Type,
        JValueLiteral=ValueLiteral
    }
}
import ceylon.interop.java {
    CeylonIterable
}
import ceylon.ast.redhat {
    createParser
}

"Converts a RedHat AST [[MemberLiteral|JMemberLiteral]] to a `ceylon.ast` [[BaseMeta]]."
shared BaseMeta baseMetaToCeylon(JMemberLiteral baseMeta) {
    "Must be unqualified"
    assert (!baseMeta.type exists,
        !baseMeta.objectExpression exists);
    "Must not be a reference expression"
    assert (!baseMeta is JFunctionLiteral|JValueLiteral); // reference expressions are subtypes of meta expressions. ew
    assert (is MemberName name = identifierToCeylon(baseMeta.identifier));
    TypeArguments? arguments;
    if (exists jArgs = baseMeta.typeArgumentList, nonempty jArguments = CeylonIterable(jArgs.types).sequence()) {
        arguments = jArguments.collect((JType jType) {
                assert (is JStaticType jType);
                return typeToCeylon(jType);
            });
    } else {
        arguments = null;
    }
    return BaseMeta(MemberNameWithTypeArguments(name, arguments));
}

"Compiles the given [[code]] for a Base Meta
 into a [[BaseMeta]] using the Ceylon compiler
 (more specifically, the rule for a `metaLiteral`)."
shared BaseMeta? compileBaseMeta(String code) {
    if (is JMemberLiteral jMetaLiteral = createParser(code).metaLiteral(),
        !jMetaLiteral.type exists,
        !jMetaLiteral.objectExpression exists,
        !jMetaLiteral is JFunctionLiteral|JValueLiteral) {
        return baseMetaToCeylon(jMetaLiteral);
    } else {
        return null;
    }
}
