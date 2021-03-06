"A type name and, optionally, type arguments."
see (`class BaseType`, `class QualifiedType`)
shared class TypeNameWithTypeArguments(name, typeArguments = null)
        extends NameWithTypeArguments() {
    "The type name."
    shared actual TypeName name;
    shared actual TypeArguments? typeArguments;
    
    shared actual [TypeName, TypeArguments=] children = [name, *(emptyOrSingleton(typeArguments))];
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformTypeNameWithTypeArguments(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitTypeNameWithTypeArguments(this);

    shared actual Boolean equals(Object that) {
        if (is TypeNameWithTypeArguments that) {
            if (exists typeArguments) {
                if (exists typeArguments_ = that.typeArguments) {
                    if (typeArguments != typeArguments_) {
                        return false;
                    }
                } else {
                    return false;
                }
            } else if (that.typeArguments exists) {
                return false;
            }
            return name == that.name;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash {
        variable value hash = 1;
        hash = 31 * hash + name.hash;
        hash = 31 * hash + (typeArguments?.hash else 0);
        return hash;
    }
    
    shared TypeNameWithTypeArguments copy(TypeName name = this.name, TypeArguments? typeArguments = this.typeArguments) {
        value ret = TypeNameWithTypeArguments(name, typeArguments);
        copyExtraInfoTo(ret);
        return ret;
    }
}
