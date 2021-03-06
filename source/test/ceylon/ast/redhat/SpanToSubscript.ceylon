import ceylon.ast.core {
    AddingExpression,
    SpanToSubscript
}
import ceylon.ast.redhat {
    RedHatTransformer,
    spanToSubscriptToCeylon,
    compileSpanToSubscript
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JElementRange=ElementRange
    }
}

shared object spanToSubscript satisfies ConcreteTest<SpanToSubscript,JElementRange> {
    
    String->SpanToSubscript construct(String->AddingExpression to)
            => "...``to.key``"->SpanToSubscript(to.item);
    
    shared String->SpanToSubscript spanToCountSubscript = construct(baseExpression.countExpression);
    
    compile = compileSpanToSubscript;
    fromCeylon = RedHatTransformer.transformSpanToSubscript;
    toCeylon = spanToSubscriptToCeylon;
    codes = [spanToCountSubscript];
}
