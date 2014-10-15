import ceylon.ast.core {
    BaseType,
    GroupedType,
    QualifiedType,
    SimpleType,
    Type,
    TypeArgument,
    TypeArguments,
    TypeNameWithTypeArguments
}

"""A utility function to create a [[QualifiedType]] directly from a string,
   without having to use [[TypeNameWithTypeArguments]] (a rather verbose name).
   
   (The type arguments will all be invariant; if you want to use use-site variance,
   you have to construct the [[TypeArgument]] objects yourself.)
   
   Usage examples:
   
       qualifiedType("X", "Y") // X.Y
       qualifiedType(qualifiedType(baseType("X", "A"), "Y", "B"), "Z", "C") //X<A>.Y<B>.Z<C>"""
shared QualifiedType qualifiedType(IdentifierIsh|SimpleType|GroupedType qualifyingType, IdentifierIsh name, IdentifierIsh|Type* typeArguments) {
    BaseType|OtherType toType<OtherType>(IdentifierIsh|OtherType typeArgument)
            given OtherType satisfies Type {
        switch (typeArgument)
        case (is IdentifierIsh) { return baseType(typeArgument); }
        case (is OtherType) { return typeArgument; }
    }
    TypeArguments? args;
    if (typeArguments nonempty) { // non-narrowing check because the narrowing would be useless; collect() loses nonemptiness info, so we have to assert below anyways
        assert (nonempty ta = typeArguments.map(toType<Type>).collect(TypeArgument));
        args = TypeArguments(ta);
    } else {
        args = null;
    }
    return QualifiedType(toType(qualifyingType), TypeNameWithTypeArguments(uidentifier(name), args));
}