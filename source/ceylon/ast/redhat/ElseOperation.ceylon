import ceylon.ast.core {
    ElseOperation,
    DisjoiningExpression,
    ThenElseExpression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JDefaultOp=DefaultOp
    }
}

"Converts a RedHat AST [[DefaultOp|JDefaultOp]] to a `ceylon.ast` [[ElseOperation]]."
shared ElseOperation elseOperationToCeylon(JDefaultOp elseOperation) {
    "Check precedence"
    assert (is ThenElseExpression left = expressionToCeylon(elseOperation.leftTerm),
        is DisjoiningExpression right = expressionToCeylon(elseOperation.rightTerm));
    return ElseOperation(left, right);
}

"Compiles the given [[code]] for an Else Operation
 into an [[ElseOperation]] using the Ceylon compiler
 (more specifically, the rule for a `thenElseExpression`)."
shared ElseOperation? compileElseOperation(String code) {
    if (is JDefaultOp jThenElseExpression = createParser(code).thenElseExpression()) {
        return elseOperationToCeylon(jThenElseExpression);
    } else {
        return null;
    }
}
