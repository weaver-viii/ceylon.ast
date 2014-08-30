import ceylon.ast.core {
    Precedence8Expression,
    SpanFromSubscript
}
import ceylon.ast.redhat {
    RedHatTransformer,
    spanFromSubscriptToCeylon,
    compileSpanFromSubscript
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JElementRange=ElementRange
    }
}

shared object spanFromSubscript satisfies ConcreteTest<SpanFromSubscript,JElementRange> {
    
    String->SpanFromSubscript construct(String->Precedence8Expression from)
            => "``from.key``..."->SpanFromSubscript(from.item);
    
    shared String->SpanFromSubscript spanFrom2Subscript = construct(integerLiteral._2IntegerLiteral);
    
    compile = compileSpanFromSubscript;
    fromCeylon = RedHatTransformer.transformSpanFromSubscript;
    toCeylon = spanFromSubscriptToCeylon;
    codes = [spanFrom2Subscript];
}
