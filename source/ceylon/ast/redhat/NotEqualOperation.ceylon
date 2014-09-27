import ceylon.ast.core {
    NotEqualOperation,
    ComparingExpression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JNotEqualOp=NotEqualOp
    }
}

"Converts a RedHat AST [[NotEqualOp|JNotEqualOp]] to a `ceylon.ast` [[NotEqualOperation]]."
shared NotEqualOperation notEqualOperationToCeylon(JNotEqualOp notEqualOperation) {
    "Check precedence"
    assert (is ComparingExpression left = expressionToCeylon(notEqualOperation.leftTerm),
        is ComparingExpression right = expressionToCeylon(notEqualOperation.rightTerm));
    return NotEqualOperation(left, right);
}

"Compiles the given [[code]] for a Not Equal Operation
 into a [[NotEqualOperation]] using the Ceylon compiler
 (more specifically, the rule for a `equalityExpression`)."
shared NotEqualOperation? compileNotEqualOperation(String code) {
    if (is JNotEqualOp jEqualityExpression = createParser(code).equalityExpression()) {
        return notEqualOperationToCeylon(jEqualityExpression);
    } else {
        return null;
    }
}
