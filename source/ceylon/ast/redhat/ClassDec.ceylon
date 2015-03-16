import ceylon.ast.core {
    ClassDec,
    DecQualifier,
    PackageQualifier
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JBaseType=BaseType,
        JClassLiteral=ClassLiteral,
        JQualifiedType=QualifiedType
    }
}

"Converts a RedHat AST [[ClassLiteral|JClassLiteral]] to a `ceylon.ast` [[ClassDec]]."
shared ClassDec classDecToCeylon(JClassLiteral classDec) {
    if (exists jType = classDec.type) {
        assert (is JBaseType|JQualifiedType jType);
        switch (jType)
        case (is JBaseType) { return ClassDec(uIdentifierToCeylon(jType.identifier), DecQualifier([], jType.packageQualified then PackageQualifier())); }
        case (is JQualifiedType) { return ClassDec(uIdentifierToCeylon(jType.identifier), decQualifierToCeylon(jType.outerType)); }
    } else {
        return ClassDec(null, null);
    }
}

"Compiles the given [[code]] for a Class Dec
 into a [[ClassDec]] using the Ceylon compiler
 (more specifically, the rule for a `metaLiteral`)."
shared ClassDec? compileClassDec(String code) {
    if (is JClassLiteral jMetaLiteral = createParser(code).metaLiteral()) {
        return classDecToCeylon(jMetaLiteral);
    } else {
        return null;
    }
}
