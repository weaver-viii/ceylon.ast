"An alias reference expression, that is,
 the [[name]] of an alias, optionally qualified by a [[qualifier]] (separated from it by a member operator ‘`.`’),
 prefixed by the type keyword `alias` and surrounded by backticks.
 
 Examples:
 
     `alias TypeName`
     `alias A.B.C"
shared class AliasDec(name, qualifier = DecQualifier())
        extends TypeDec() {
    
    shared actual UIdentifier name;
    shared actual DecQualifier qualifier;
    
    keyword = "alias";
    
    shared actual <DecQualifier|Identifier>[] children = concatenate(emptyOrSingleton(qualifier), [name]);
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformAliasDec(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitAliasDec(this);

    shared actual Boolean equals(Object that) {
        if (is AliasDec that) {
            return name == that.name && qualifier == that.qualifier;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (name.hash + 31 * qualifier.hash);
    
    shared AliasDec copy(UIdentifier name = this.name, DecQualifier qualifier = this.qualifier) {
        value ret = AliasDec(name, qualifier);
        copyExtraInfoTo(ret);
        return ret;
    }
}
