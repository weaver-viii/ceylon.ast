import ceylon.ast.core {
    Annotations,
    CaseTypes,
    ClassDefinition,
    Declaration,
    ExtendedType,
    Parameter,
    Parameters,
    SatisfiedTypes,
    Statement,
    TypeConstraint,
    TypeParameters
}

"""Creates a class definition.
   
   Usage example:
   
       classDefinition {
           name = "MyClass";
           parameters = {
               ValueParameter {
                   annotations = annotations { "shared", "actual" };
                   type = baseType("String");
                   name = lidentifier("string");
               }
           };
           caseTypes = { "CT1", "CT2" };
           extendedType = extendedType {
               "Super";
               IntegerLiteral("1"), baseExpression("string")
           };
           satisfiedTypes = { "Identifiable" };
           typeParameters = { "Element", "Absent" };
           annotations = annotations {
               "My class does something.
                
                It’s the most amazing class ever.";
               "shared"
           };
           
           functionDefinition {
               // ...
           },
           functionDefinition {
               // ...
           }
       }"""
shared ClassDefinition classDefinition(
    name,
    parameters = Parameters(),
    body = [],
    caseTypes = null,
    extendedType = null,
    satisfiedTypes = null,
    typeParameters = null,
    typeConstraints = [],
    annotations = Annotations()) {
    
    IdentifierIsh name;
    Parameters|{Parameter*}? parameters;
    {Declaration|Statement*} body;
    {CaseTypeIsh*}|CaseTypes? caseTypes;
    ExtendedType? extendedType;
    {PrimaryTypeIsh*}|SatisfiedTypes? satisfiedTypes;
    {TypeParameterIsh*}|TypeParameters? typeParameters;
    {TypeConstraint*} typeConstraints;
    Annotations annotations;
    
    return ClassDefinition {
        name = uidentifier(name);
        body = classBody(body);
        parameters = optionalParameters_internal(parameters);
        caseTypes = caseTypes_internal(caseTypes);
        extendedType = extendedType;
        satisfiedTypes = satisfiedTypes_internal(satisfiedTypes);
        typeParameters = typeParameters_internal(typeParameters);
        typeConstraints = typeConstraints.sequence();
        annotations = annotations;
    };
}
