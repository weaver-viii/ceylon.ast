import ceylon.ast.core {
    BaseExpression,
    BaseType,
    LIdentifier,
    MemberNameWithTypeArguments,
    TypeNameWithTypeArguments,
    UIdentifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    baseExpressionToCeylon,
    compileBaseExpression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JBaseMemberOrTypeExpression=BaseMemberOrTypeExpression
    }
}

shared object baseExpression satisfies ConcreteTest<BaseExpression,JBaseMemberOrTypeExpression> {
    shared String->BaseExpression nullExpression = "null"->BaseExpression(MemberNameWithTypeArguments(LIdentifier("null"), null));
    shared String->BaseExpression maxOfIntegerNothingExpression = "max<Integer,Nothing>"->BaseExpression(MemberNameWithTypeArguments(LIdentifier("max"), [BaseType(TypeNameWithTypeArguments(UIdentifier("Integer"))), BaseType(TypeNameWithTypeArguments(UIdentifier("Nothing")))]));
    shared String->BaseExpression processExpression = "process"->BaseExpression(MemberNameWithTypeArguments(LIdentifier("process")));
    
    // not tested directly, but used by other tests
    shared String->BaseExpression aExpression = "a"->BaseExpression(MemberNameWithTypeArguments(LIdentifier("a")));
    shared String->BaseExpression bExpression = "b"->BaseExpression(MemberNameWithTypeArguments(LIdentifier("b")));
    shared String->BaseExpression cExpression = "c"->BaseExpression(MemberNameWithTypeArguments(LIdentifier("c")));
    shared String->BaseExpression iExpression = "i"->BaseExpression(MemberNameWithTypeArguments(LIdentifier("i")));
    shared String->BaseExpression trueExpression = "true"->BaseExpression(MemberNameWithTypeArguments(LIdentifier("true")));
    shared String->BaseExpression parsedIntExpression = "parsedInt"->BaseExpression(MemberNameWithTypeArguments(LIdentifier("parsedInt")));
    shared String->BaseExpression nameExpression = "name"->BaseExpression(MemberNameWithTypeArguments(LIdentifier("name")));
    shared String->BaseExpression textExpression = "text"->BaseExpression(MemberNameWithTypeArguments(LIdentifier("text")));
    shared String->BaseExpression stepExpression = "step"->BaseExpression(MemberNameWithTypeArguments(LIdentifier("step")));
    shared String->BaseExpression balanceExpression = "balance"->BaseExpression(MemberNameWithTypeArguments(LIdentifier("balance")));
    shared String->BaseExpression interestRateExpression = "interestRate"->BaseExpression(MemberNameWithTypeArguments(LIdentifier("interestRate")));
    shared String->BaseExpression incrementExpression = "increment"->BaseExpression(MemberNameWithTypeArguments(LIdentifier("increment")));
    shared String->BaseExpression countdownExpression = "countdown"->BaseExpression(MemberNameWithTypeArguments(LIdentifier("countdown")));
    shared String->BaseExpression \iΔtExpression = "\\iΔt"->BaseExpression(MemberNameWithTypeArguments(LIdentifier("Δt")));
    
    compile = compileBaseExpression;
    fromCeylon = RedHatTransformer.transformBaseExpression;
    toCeylon = baseExpressionToCeylon;
    codes = [nullExpression, maxOfIntegerNothingExpression];
}
