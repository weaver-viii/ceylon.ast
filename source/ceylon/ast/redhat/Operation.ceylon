import ceylon.ast.core {
    Operation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JOperatorExpression=OperatorExpression,
        JUnaryOperatorExpression=UnaryOperatorExpression
    }
}

"Converts a RedHat AST [[OperatorExpression|JOperatorExpression]] to a `ceylon.ast` [[Operation]]."
shared Operation operationToCeylon(JOperatorExpression operatorExpression) {
    assert (is JUnaryOperatorExpression operatorExpression); // TODO more case types!
    switch (operatorExpression)
    case (is JUnaryOperatorExpression) { return unaryOperationToCeylon(operatorExpression); }
}

"Compiles the given [[code]] for an Operation
 into an [[Operation]] using the Ceylon compiler
 (more specifically, the rule for an `assignmentExpression`)."
shared Operation? compileOperation(String code) {
    if (is JOperatorExpression jExpression = createParser(code).assignmentExpression()) {
        return operationToCeylon(jExpression);
    } else {
        return null;
    }
}