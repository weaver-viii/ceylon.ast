import ceylon.ast.core {
    EntryOperation,
    AddingExpression
}
import ceylon.ast.redhat {
    RedHatTransformer,
    entryOperationToCeylon,
    compileEntryOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JEntryOp=EntryOp
    }
}

shared object entryOperation satisfies ConcreteTest<EntryOperation,JEntryOp> {
    
    String->EntryOperation construct(String->AddingExpression left, String->AddingExpression right)
            => "``left.key``->``right.key``"->EntryOperation(left.item, right.item);
    
    shared String->EntryOperation cCharToCStringExpression = construct(characterLiteral.capitalCCharacterLiteral, stringLiteral.capitalCStringLiteral);
    
    compile = compileEntryOperation;
    fromCeylon = RedHatTransformer.transformEntryOperation;
    toCeylon = entryOperationToCeylon;
    codes = [cCharToCStringExpression];
}
