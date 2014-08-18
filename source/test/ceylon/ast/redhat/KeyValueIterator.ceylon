import ceylon.ast.core {
    Expression,
    KeyValueIterator,
    LIdentifier,
    Type,
    UnspecifiedVariable
}
import ceylon.ast.redhat {
    RedHatTransformer,
    keyValueIteratorToCeylon,
    compileKeyValueIterator
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JKeyValueIterator=KeyValueIterator
    }
}

shared object keyValueIterator satisfies ConcreteTest<KeyValueIterator,JKeyValueIterator> {
    
    String->KeyValueIterator construct(String->LIdentifier keyName, <String->Type>? keyType, String->LIdentifier valueName, <String->Type>? valueType, String->Expression iterated)
            => "(`` keyType?.key else "" `` ``keyName.key`` -> `` valueType?.key else "" `` ``valueName.key`` in ``iterated.key``)"->KeyValueIterator(UnspecifiedVariable(keyName.item, keyType?.item), UnspecifiedVariable(valueName.item, valueType?.item), iterated.item);
    
    shared String->KeyValueIterator nameToPersonInPeopleByNameIterator = construct(identifier.nameLIdentifier, null, identifier.personLIdentifier, null, baseExpression.peopleByNameExpression);
    shared String->KeyValueIterator intIndexToCharCharInTextIndexedIterator = construct(identifier.indexLIdentifier, baseType.integerType, identifier.charLIdentifier, baseType.characterType, qualifiedExpression.textIndexedQualifiedExpression);
    
    compile = compileKeyValueIterator;
    fromCeylon = RedHatTransformer.transformKeyValueIterator;
    toCeylon = keyValueIteratorToCeylon;
    codes = [nameToPersonInPeopleByNameIterator, intIndexToCharCharInTextIndexedIterator];
}