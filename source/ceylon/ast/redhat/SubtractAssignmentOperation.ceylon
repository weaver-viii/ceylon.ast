import ceylon.ast.core {
    ThenElseExpression,
    AssigningExpression,
    SubtractAssignmentOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JSubtractAssignOp=SubtractAssignOp
    }
}

"Converts a RedHat AST [[SubtractAssignOp|JSubtractAssignOp]] to a `ceylon.ast` [[SubtractAssignmentOperation]]."
shared SubtractAssignmentOperation subtractAssignmentOperationToCeylon(JSubtractAssignOp subtractAssignmentOperation) {
    "Check precedence"
    assert (is ThenElseExpression left = expressionToCeylon(subtractAssignmentOperation.leftTerm),
        is AssigningExpression right = expressionToCeylon(subtractAssignmentOperation.rightTerm));
    return SubtractAssignmentOperation(left, right);
}

"Compiles the given [[code]] for a Subtract Assignment Operation
 into a [[SubtractAssignmentOperation]] using the Ceylon compiler
 (more specifically, the rule for an `assignmentExpression`)."
shared SubtractAssignmentOperation? compileSubtractAssignmentOperation(String code) {
    if (is JSubtractAssignOp jAssignmentExpression = createParser(code).assignmentExpression()) {
        return subtractAssignmentOperationToCeylon(jAssignmentExpression);
    } else {
        return null;
    }
}
