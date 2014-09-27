import ceylon.ast.core {
    UnioningExpression,
    MultiplyingExpression,
    QuotientOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JQuotientOp=QuotientOp
    }
}

"Converts a RedHat AST [[QuotientOp|JQuotientOp]] to a `ceylon.ast` [[QuotientOperation]]."
shared QuotientOperation quotientOperationToCeylon(JQuotientOp divisionOperation) {
    "Check precedence"
    assert (is MultiplyingExpression left = expressionToCeylon(divisionOperation.leftTerm),
        is UnioningExpression right = expressionToCeylon(divisionOperation.rightTerm));
    return QuotientOperation(left, right);
}

"Compiles the given [[code]] for a Quotient Operation
 into a [[QuotientOperation]] using the Ceylon compiler
 (more specifically, the rule for a `multiplicativeExpression`)."
shared QuotientOperation? compileQuotientOperation(String code) {
    if (is JQuotientOp jMultiplicativeExpression = createParser(code).multiplicativeExpression()) {
        return quotientOperationToCeylon(jMultiplicativeExpression);
    } else {
        return null;
    }
}
