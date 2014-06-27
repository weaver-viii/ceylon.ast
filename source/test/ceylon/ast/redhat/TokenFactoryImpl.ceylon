import ceylon.ast.redhat {
    TokenFactory,
    TokenFactoryImpl
}
import ceylon.test {
    test,
    assertEquals
}

test
shared void tokenFactoryImpl() {
    TokenFactory f = TokenFactoryImpl();
    value foo = f.token("foo", 0);
    value bar = f.token("bar", 1);
    assertEquals(foo.tokenIndex, 0);
    assertEquals(bar.tokenIndex, 1);
    assertEquals(foo.startIndex, 0);
    assertEquals(foo.stopIndex, 2);
    assertEquals(bar.startIndex, 3);
    assertEquals(bar.stopIndex, 5);
}
