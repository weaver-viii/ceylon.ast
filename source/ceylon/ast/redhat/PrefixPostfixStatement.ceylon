import ceylon.ast.core {
    Node,
    PrefixPostfixStatement
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JExpressionStatement=ExpressionStatement,
        JPrefixOperatorExpression=PrefixOperatorExpression,
        JPostfixOperatorExpression=PostfixOperatorExpression
    }
}

"Converts a RedHat AST [[ExpressionStatement|JExpressionStatement]] to a `ceylon.ast` [[PrefixPostfixStatement]]."
shared PrefixPostfixStatement prefixPostfixStatementToCeylon(JExpressionStatement prefixPostfixStatement, Anything(JNode,Node) update = noop) {
    assert (is JPrefixOperatorExpression|JPostfixOperatorExpression expression = prefixPostfixStatement.expression.term);
    PrefixPostfixStatement result;
    switch (expression)
    case (is JPrefixOperatorExpression) { result = PrefixPostfixStatement(prefixOperationToCeylon(expression, update)); }
    case (is JPostfixOperatorExpression) { result = PrefixPostfixStatement(postfixOperationToCeylon(expression, update)); }
    update(prefixPostfixStatement, result);
    return result;
}

"Compiles the given [[code]] for a Prefix Postfix Statement
 into a [[PrefixPostfixStatement]] using the Ceylon compiler
 (more specifically, the rule for an `expressionOrSpecificationStatement`)."
shared PrefixPostfixStatement? compilePrefixPostfixStatement(String code, Anything(JNode,Node) update = noop) {
    if (is JExpressionStatement jExpressionOrSpecificationStatement = createParser(code).expressionOrSpecificationStatement(),
        jExpressionOrSpecificationStatement.expression.term is JPrefixOperatorExpression|JPostfixOperatorExpression) {
        return prefixPostfixStatementToCeylon(jExpressionOrSpecificationStatement, update);
    } else {
        return null;
    }
}
