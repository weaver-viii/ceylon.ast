import ceylon.ast.core {
    Parameter
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JAttributeDeclaration=AttributeDeclaration,
        JFunctionalParameterDeclaration=FunctionalParameterDeclaration,
        JInitializerParameter=InitializerParameter,
        JParameter=Parameter,
        JParameterDeclaration=ParameterDeclaration,
        JSequencedType=SequencedType,
        JValueParameterDeclaration=ValueParameterDeclaration
    }
}

"Converts a RedHat AST [[Parameter|JParameter]] to a `ceylon.ast` [[Parameter]]."
shared Parameter parameterToCeylon(JParameter parameter) {
    assert (is JParameterDeclaration|JInitializerParameter parameter);
    switch (parameter)
    case (is JParameterDeclaration) {
        assert (is JValueParameterDeclaration|JFunctionalParameterDeclaration parameter);
        if (parameter.typedDeclaration.type is JSequencedType) {
            assert (is JValueParameterDeclaration parameter);
            return variadicParameterToCeylon(parameter);
        } else {
            switch (parameter)
            case (is JValueParameterDeclaration) {
                assert (is JAttributeDeclaration dec = parameter.typedDeclaration);
                if (dec.specifierOrInitializerExpression exists) {
                    return defaultedValueParameterToCeylon(parameter);
                } else {
                    return valueParameterToCeylon(parameter);
                }
            }
            case (is JFunctionalParameterDeclaration) {
                // TODO implement functional parameters
                throw AssertionError("Functional parameters not yet implemented");
            }
        }
    }
    case (is JInitializerParameter) {
        if (parameter.specifierExpression exists) {
            return defaultedParameterReferenceToCeylon(parameter);
        } else {
            return parameterReferenceToCeylon(parameter);
        }
    }
}

"Compiles the given [[code]] for a Parameter
 into a [[Parameter]] using the Ceylon compiler
 (more specifically, the rule for a `parameterDeclarationOrRef`)."
shared Parameter? compileParameter(String code) {
    if (exists jParameterDeclarationOrRef = createParser(code + ",").parameterDeclarationOrRef()) {
        /*
         The parser does some lookahead and seems to need that comma to parse a parameterRef
         */
        return parameterToCeylon(jParameterDeclarationOrRef);
    } else {
        return null;
    }
}
