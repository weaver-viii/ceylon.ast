shared alias TypeArguments => [Type+];

"All node types in the type sub-hierarchy:
 [[Type]] and some auxiliary node types."
shared alias TypeIsh => Type|TypeNameWithArguments|VariadicType;

"Representation of a type."
shared abstract class Type(children)
/* TODO of UnionedType|EntryType */
        extends Node(children) {
    shared actual TypeIsh[] children;
    
    "Tests for equality of two type nodes.
     
     Note: This does __not__ test for equality of the represented types!
     For example, even though the types `X|Y` and `Y|X` are considered equal
     by the language, the nodes `UnionType(x, y)` and `UnionType(y, x)` are
     _not_ considered equal.
     (Type equality is a complicated problem, the solution of which doesn’t
      belong in `ceylon.ast`.)"
    shared actual formal Boolean equals(Object that);
}
