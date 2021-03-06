import ceylon.ast.core {
    FullPackageName,
    Import,
    ImportElements
}
import ceylon.ast.redhat {
    RedHatTransformer,
    importToCeylon,
    compileImport
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JImport=Import
    }
}

shared object \iimport satisfies ConcreteTest<Import,JImport> {
    
    String->Import construct(String->FullPackageName packageName, String->ImportElements elements)
            => "import ``packageName.key````elements.key``"->Import(packageName.item, elements.item);
    
    shared String->Import ceylonAstWildcardImport = construct(fullPackageName.ceylonAstCorePackageName, importElements.wildcardImportElements);
    shared String->Import javaLangImport = construct(fullPackageName.javaLangPackageName, importElements.systemImportElements);
    shared String->Import ceylonCollectionImport = construct(fullPackageName.ceylonCollectionPackageName, importElements.collectionImportElements);
    
    compile = compileImport;
    fromCeylon = RedHatTransformer.transformImport;
    toCeylon = importToCeylon;
    codes = [ceylonAstWildcardImport, javaLangImport, ceylonCollectionImport];
}
