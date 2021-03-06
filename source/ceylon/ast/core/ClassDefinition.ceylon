"""A class definition.
   
   A class definition has the following components:
   - [[annotations]],
   - the ‘`class`’ keyword,
   - the [[name]],
   - the [[type parameters|typeParameters]], if present,
   - the [[parameters]], if present,
   - the [[case types|caseTypes]], if present,
   - the [[extended type|extendedType]], if present,
   - the [[satisfied types|satisfiedTypes]], if present,
   - the [[type constraints|typeConstraints]], if present, and
   - the [[body]].
   
   Examples (multi-line):
   
       shared class PrintableWrapper<T>(shared T wrapped)
               satisfies Printable {
           shared actual void print() {
               package.print(wrapped else "<null>");
           }
       }
   
       shared class Counter(Integer initialCount=0) {
           
           variable Integer n = initialCount;
           
           shared Integer count => n;
           
           shared void increment() => n++;
       }"""
shared class ClassDefinition(name, parameters, body, caseTypes = null, extendedType = null, satisfiedTypes = null, typeParameters = null, typeConstraints = [], annotations = Annotations())
        extends AnyClass() {
    
    "The name of the class."
    shared actual UIdentifier name;
    "The parameters of the class."
    shared actual Parameters? parameters;
    "The body of the class."
    shared ClassBody body;
    "The case types of the class."
    shared actual CaseTypes? caseTypes;
    "The extended type of the class."
    shared actual ExtendedType? extendedType;
    "The satisfied types of the class."
    shared actual SatisfiedTypes? satisfiedTypes;
    "The type parameters of the class."
    shared actual TypeParameters? typeParameters;
    "The type constraints on the class’ [[type parameters|typeParameters]]."
    shared actual TypeConstraint[] typeConstraints;
    "The annotations of the class."
    shared actual Annotations annotations;
    
    shared actual <Annotations|UIdentifier|TypeParameters|Parameters|CaseTypes|ExtendedType|SatisfiedTypes|TypeConstraint|ClassBody>[] children
            = concatenate(
        [annotations],
        [name],
        emptyOrSingleton(typeParameters),
        emptyOrSingleton(parameters),
        emptyOrSingleton(caseTypes),
        emptyOrSingleton(extendedType),
        emptyOrSingleton(satisfiedTypes),
        typeConstraints,
        [body]
    );
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformClassDefinition(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitClassDefinition(this);

    shared actual Boolean equals(Object that) {
        if (is ClassDefinition that) {
            if (exists caseTypes) {
                if (exists caseTypes_ = that.caseTypes) {
                    if (caseTypes != caseTypes_) {
                        return false;
                    }
                } else {
                    return false;
                }
            } else if (that.caseTypes exists) {
                return false;
            }
            if (exists extendedType) {
                if (exists extendedType_ = that.extendedType) {
                    if (extendedType != extendedType_) {
                        return false;
                    }
                } else {
                    return false;
                }
            } else if (that.extendedType exists) {
                return false;
            }
            if (exists satisfiedTypes) {
                if (exists satisfiedTypes_ = that.satisfiedTypes) {
                    if (satisfiedTypes != satisfiedTypes_) {
                        return false;
                    }
                } else {
                    return false;
                }
            } else if (that.satisfiedTypes exists) {
                return false;
            }
            if (exists typeParameters) {
                if (exists typeParameters_ = that.typeParameters) {
                    if (typeParameters != typeParameters_) {
                        return false;
                    }
                } else {
                    return false;
                }
            } else if (that.typeParameters exists) {
                return false;
            }
            if (exists parameters) {
                if (exists parameters_ = that.parameters) {
                    if (parameters != parameters_) {
                        return false;
                    }
                } else {
                    return false;
                }
            } else if (that.parameters exists) {
                return false;
            }
            return name == that.name && body == that.body && typeConstraints == that.typeConstraints && annotations == that.annotations;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (name.hash + 31 * ((parameters?.hash else 0) + 31 * (body.hash + 31 * ((caseTypes?.hash else 0) + 31 * ((extendedType?.hash else 0) + 31 * ((satisfiedTypes?.hash else 0) + 31 * ((typeParameters?.hash else 0) + 31 * (typeConstraints.hash + 31 * annotations.hash))))))));
    
    shared ClassDefinition copy(UIdentifier name = this.name, Parameters? parameters = this.parameters, ClassBody body = this.body, CaseTypes? caseTypes = this.caseTypes, ExtendedType? extendedType = this.extendedType, SatisfiedTypes? satisfiedTypes = this.satisfiedTypes, TypeParameters? typeParameters = this.typeParameters, TypeConstraint[] typeConstraints = this.typeConstraints, Annotations annotations = this.annotations) {
        value ret = ClassDefinition(name, parameters, body, caseTypes, extendedType, satisfiedTypes, typeParameters, typeConstraints, annotations);
        copyExtraInfoTo(ret);
        return ret;
    }
}
