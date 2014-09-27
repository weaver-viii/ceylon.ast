"A postfix existence test expression.
 
 No associativity.
 
 Examples:
 
     element exists
     parseInteger(text) exists"
shared class ExistsOperation(operand_)
        extends UnaryOperation() {
    
    // TODO operand_ is a workaround for ceylon-compiler#1728, remove!
    SpanningExpression operand_;
    
    "The operand expression whose existence is tested."
    shared actual SpanningExpression operand = operand_;
    
    shared actual [SpanningExpression] children = [operand];
    
    operator = "exists";
    
    prefix = false;
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformExistsOperation(this);
    
    shared actual Boolean equals(Object that) {
        if (is ExistsOperation that) {
            return operand == that.operand;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * operand.hash;
    
    shared ExistsOperation copy(SpanningExpression operand = this.operand) {
        value ret = ExistsOperation(operand);
        copyExtraInfoTo(ret);
        return ret;
    }
}
