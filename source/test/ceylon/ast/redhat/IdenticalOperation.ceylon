import ceylon.ast.core {
    IdenticalOperation,
    ComparingExpression
}
import ceylon.ast.redhat {
    RedHatTransformer,
    identicalOperationToCeylon,
    compileIdenticalOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JIdenticalOp=IdenticalOp
    }
}

shared object identicalOperation satisfies ConcreteTest<IdenticalOperation,JIdenticalOp> {
    
    String->IdenticalOperation construct(String->ComparingExpression left, String->ComparingExpression right)
            => "``left.key``===``right.key``"->IdenticalOperation(left.item, right.item);
    
    shared String->IdenticalOperation aIdenticalBExpression = construct(baseExpression.aExpression, baseExpression.bExpression);
    
    compile = compileIdenticalOperation;
    fromCeylon = RedHatTransformer.transformIdenticalOperation;
    toCeylon = identicalOperationToCeylon;
    codes = [aIdenticalBExpression];
}
