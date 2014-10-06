import ceylon.ast.core {
    CaseTypes,
    MemberName,
    PrimaryType
}

shared alias CaseTypesIsh<Absent>
        given Absent satisfies Null
        => CaseTypes|Iterable<PrimaryType|MemberName,Absent>;

"""Converts a stream of [[primary types and anonymous class names|caseTypes]]
   to [[CaseTypes]].
   
   This function is not intended to be used directly; instead, it is used
   by functions like [[classDefinition]] and [[interfaceDefinition]].
   
   If the stream is guaranteed nonempty, then the return type is nonoptional
   (`Absent=Nothing`); if it may be empty, the return type is optional.
   Rationale: All `ceylon.ast` nodes with a `caseTypes` child make it optional,
   i. e., of type `CaseTypes?`; the helper functions for these nodes then
   declare parameters of type `CaseTypesIsh<Null>`, signifying that the
   [[CaseTypes]] node can be `null` if the received stream is empty.
   On the other hand, this function may also be used like this:
   
       CaseTypes ct = caseTypes({ lidentifier("true"), lidentifier("false") });
   
   where the inferred type for the argument is `Iterable<LIdentifier,Nothing>`,
   i. e., `Absent=Nothing`, and therefore the return type is nonoptional."""
shared CaseTypes|Absent caseTypes<Absent>(CaseTypesIsh<Absent> caseTypes)
        given Absent satisfies Null {
    if (is CaseTypes caseTypes) {
        return caseTypes;
    } else {
        assert (is Iterable<PrimaryType|MemberName,Absent> caseTypes);
        if (is Sequence<PrimaryType|MemberName> seq = caseTypes.sequence()) {
            return CaseTypes(seq);
        } else {
            assert (is Absent null);
            return null;
        }
    }
}
