import ceylon.test {
    test,
    assertEquals
}
import ceylon.file {
    File,
    parsePath
}
import ceylon.ast.core {
    CeylonExpressionTransformer
}

"Tests that [[CeylonExpressionTransformer]] returns a valid expression."
test
shared void testCeylonExpressionTransformer() {
    assert (is File completeCUFile = parsePath("source/test/ceylon/ast/core/completeCompilationUnit.ceylon").resource);
    String completeCUCode;
    try (r = completeCUFile.Reader("UTF-8")) {
        StringBuilder completeCUCodeSb = StringBuilder();
        /*
         Structure:
         
             bla bla bla
             /* BEGIN */ code
             code code /* END */ bla
             bla bla
         */
        while (exists l = r.readLine()) {
            if (exists i = l.firstInclusion("/* BEGIN */")) {
                completeCUCodeSb.append(l[(i + "/* BEGIN */".size)...]);
                completeCUCodeSb.appendNewline();
                break;
            }
        }
        while (exists l = r.readLine()) {
            if (exists i = l.firstInclusion("/* END */")) {
                completeCUCodeSb.append(l[... i - 1]);
                break;
            } else {
                completeCUCodeSb.append(l);
                completeCUCodeSb.appendNewline();
            }
        }
        completeCUCode = completeCUCodeSb.string.trimmed;
    }
    
    assertEquals {
        expected = completeCUCode;
        actual = completeCompilationUnit.transform(CeylonExpressionTransformer());
    };
}