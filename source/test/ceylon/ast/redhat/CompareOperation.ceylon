import ceylon.ast.core {
    CompareOperation,
    ExistsNonemptyExpression
}
import ceylon.ast.redhat {
    RedHatTransformer,
    compareOperationToCeylon,
    compileCompareOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JCompareOp=CompareOp
    }
}

shared object compareOperation satisfies ConcreteTest<CompareOperation,JCompareOp> {
    
    String->CompareOperation construct(String->ExistsNonemptyExpression left, String->ExistsNonemptyExpression right)
            => "``left.key``<=>``right.key``"->CompareOperation(left.item, right.item);
    
    shared String->CompareOperation aCompareBExpression = construct(baseExpression.aExpression, baseExpression.bExpression);
    
    compile = compileCompareOperation;
    fromCeylon = RedHatTransformer.transformCompareOperation;
    toCeylon = compareOperationToCeylon;
    codes = [aCompareBExpression];
}
