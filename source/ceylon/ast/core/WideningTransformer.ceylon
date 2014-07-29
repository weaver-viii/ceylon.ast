"A [[Transformer]] with the default operation to widen the type of the visited subject:
 [[transformLIdentifier]] delegates to [[transformIdentifier]], which in turn delegates to
 [[transformNode]], which ([[Node]] being without a superclass) is the only `formal` method left."
see (`class Visitor`)
shared interface WideningTransformer<out Result> satisfies Transformer<Result> {
    shared actual default Result transformAddAssignmentOperation(AddAssignmentOperation that) => transformArithmeticAssignmentOperation(that);
    shared actual default Result transformAndAssignmentOperation(AndAssignmentOperation that) => transformLogicalAssignmentOperation(that);
    shared actual default Result transformAndOperation(AndOperation that) => transformLogicalOperation(that);
    shared actual default Result transformAnnotation(Annotation that) => transformNode(that);
    shared actual default Result transformAnnotations(Annotations that) => transformNode(that);
    shared actual default Result transformAnonymousArgument(AnonymousArgument that) => transformNamedArgument(that);
    shared actual default Result transformAnySpecifier(AnySpecifier that) => transformExpressionIsh(that);
    shared actual default Result transformArgumentList(ArgumentList that) => transformExpressionIsh(that);
    shared actual default Result transformArguments(Arguments that) => transformExpressionIsh(that);
    shared actual default Result transformArithmeticAssignmentOperation(ArithmeticAssignmentOperation that) => transformAssignmentOperation(that);
    shared actual default Result transformArithmeticOperation(ArithmeticOperation that) => transformBinaryOperation(that);
    shared actual default Result transformAssignOperation(AssignOperation that) => transformAssignmentOperation(that);
    shared actual default Result transformAssignmentOperation(AssignmentOperation that) => transformBinaryOperation(that);
    shared actual default Result transformAtom(Atom that) => transformPrimary(that);
    shared actual default Result transformBaseExpression(BaseExpression that) => transformPrimary(that);
    shared actual default Result transformBaseMeta(BaseMeta that) => transformMeta(that);
    shared actual default Result transformBaseType(BaseType that) => transformSimpleType(that);
    shared actual default Result transformBinaryOperation(BinaryOperation that) => transformOperation(that);
    shared actual default Result transformBound(Bound that) => transformExpressionIsh(that);
    shared actual default Result transformCallableParameter(CallableParameter that) => transformRequiredParameter(that);
    shared actual default Result transformCallableType(CallableType that) => transformPrimaryType(that);
    shared actual default Result transformCharacterLiteral(CharacterLiteral that) => transformLiteral(that);
    shared actual default Result transformClosedBound(ClosedBound that) => transformBound(that);
    shared actual default Result transformCompareOperation(CompareOperation that) => transformBinaryOperation(that);
    shared actual default Result transformComparisonOperation(ComparisonOperation that) => transformBinaryOperation(that);
    shared actual default Result transformCompilationUnit(CompilationUnit that) => transformNode(that);
    shared actual default Result transformComplementAssignmentOperation(ComplementAssignmentOperation that) => transformSetAssignmentOperation(that);
    shared actual default Result transformComplementOperation(ComplementOperation that) => transformSetOperation(that);
    shared actual default Result transformDec(Dec that) => transformPrimary(that);
    shared actual default Result transformDeclaration(Declaration that) => transformNode(that);
    shared actual default Result transformDefaultedCallableParameter(DefaultedCallableParameter that) => transformDefaultedParameter(that);
    shared actual default Result transformDefaultedParameter(DefaultedParameter that) => transformParameter(that);
    shared actual default Result transformDefaultedParameterReference(DefaultedParameterReference that) => transformDefaultedParameter(that);
    shared actual default Result transformDefaultedType(DefaultedType that) => transformTypeIsh(that);
    shared actual default Result transformDefaultedValueParameter(DefaultedValueParameter that) => transformDefaultedParameter(that);
    shared actual default Result transformDifferenceOperation(DifferenceOperation that) => transformArithmeticOperation(that);
    shared actual default Result transformDivideAssignmentOperation(DivideAssignmentOperation that) => transformArithmeticAssignmentOperation(that);
    shared actual default Result transformDynamicModifier(DynamicModifier that) => transformModifier(that);
    shared actual default Result transformDynamicValue(DynamicValue that) => transformAtom(that);
    shared actual default Result transformElseOperation(ElseOperation that) => transformBinaryOperation(that);
    shared actual default Result transformEntryOperation(EntryOperation that) => transformBinaryOperation(that);
    shared actual default Result transformEntryType(EntryType that) => transformType(that);
    shared actual default Result transformEqualOperation(EqualOperation that) => transformEqualityOperation(that);
    shared actual default Result transformEqualityOperation(EqualityOperation that) => transformBinaryOperation(that);
    shared actual default Result transformExistsOperation(ExistsOperation that) => transformUnaryOperation(that);
    shared actual default Result transformExponentiationOperation(ExponentiationOperation that) => transformBinaryOperation(that);
    shared actual default Result transformExpression(Expression that) => transformExpressionIsh(that);
    shared actual default Result transformExpressionIsh(ExpressionIsh that) => transformNode(that);
    shared actual default Result transformFloatLiteral(FloatLiteral that) => transformLiteral(that);
    shared actual default Result transformFullPackageName(FullPackageName that) => transformExpressionIsh(that);
    shared actual default Result transformGivenDec(GivenDec that) => transformTypeDec(that);
    shared actual default Result transformGroupedExpression(GroupedExpression that) => transformAtom(that);
    shared actual default Result transformGroupedType(GroupedType that) => transformPrimaryType(that);
    shared actual default Result transformIdenticalOperation(IdenticalOperation that) => transformEqualityOperation(that);
    shared actual default Result transformIdentifier(Identifier that) => transformExpressionIsh(that);
    shared actual default Result transformIdentityOperation(IdentityOperation that) => transformUnaryArithmeticOperation(that);
    shared actual default Result transformInOperation(InOperation that) => transformBinaryOperation(that);
    shared actual default Result transformIntegerLiteral(IntegerLiteral that) => transformLiteral(that);
    shared actual default Result transformIntersectAssignmentOperation(IntersectAssignmentOperation that) => transformSetAssignmentOperation(that);
    shared actual default Result transformIntersectionOperation(IntersectionOperation that) => transformBinaryOperation(that);
    shared actual default Result transformIntersectionType(IntersectionType that) => transformUnionableType(that);
    shared actual default Result transformInvocation(Invocation that) => transformPrimary(that);
    shared actual default Result transformIsOperation(IsOperation that) => transformUnaryTypeOperation(that);
    shared actual default Result transformIterable(Iterable that) => transformAtom(that);
    shared actual default Result transformIterableType(IterableType that) => transformPrimaryType(that);
    shared actual default Result transformLIdentifier(LIdentifier that) => transformIdentifier(that);
    shared actual default Result transformLargeAsOperation(LargeAsOperation that) => transformComparisonOperation(that);
    shared actual default Result transformLargerOperation(LargerOperation that) => transformComparisonOperation(that);
    shared actual default Result transformLazySpecifier(LazySpecifier that) => transformAnySpecifier(that);
    shared actual default Result transformLiteral(Literal that) => transformNode(that);
    shared actual default Result transformLogicalAssignmentOperation(LogicalAssignmentOperation that) => transformAssignmentOperation(that);
    shared actual default Result transformLogicalOperation(LogicalOperation that) => transformBinaryOperation(that);
    shared actual default Result transformMainType(MainType that) => transformType(that);
    shared actual default Result transformMeasureOperation(MeasureOperation that) => transformBinaryOperation(that);
    shared actual default Result transformMemberMeta(MemberMeta that) => transformMeta(that);
    shared actual default Result transformMemberNameWithTypeArguments(MemberNameWithTypeArguments that) => transformNameWithTypeArguments(that);
    shared actual default Result transformMeta(Meta that) => transformPrimary(that);
    shared actual default Result transformModifier(Modifier that) => transformExpressionIsh(that);
    shared actual default Result transformModuleDec(ModuleDec that) => transformDec(that);
    shared actual default Result transformMultiplyAssignmentOperation(MultiplyAssignmentOperation that) => transformArithmeticAssignmentOperation(that);
    shared actual default Result transformNameWithTypeArguments(NameWithTypeArguments that) => transformTypeIsh(that);
    shared actual default Result transformNamedArgument(NamedArgument that) => transformExpressionIsh(that);
    shared actual default Result transformNamedArguments(NamedArguments that) => transformArguments(that);
    shared actual default Result transformNegationOperation(NegationOperation that) => transformUnaryArithmeticOperation(that);
    shared actual default Result transformNonemptyOperation(NonemptyOperation that) => transformUnaryOperation(that);
    shared actual default Result transformNotEqualOperation(NotEqualOperation that) => transformEqualityOperation(that);
    shared actual default Result transformNotOperation(NotOperation that) => transformUnaryOperation(that);
    shared actual default Result transformOfOperation(OfOperation that) => transformUnaryTypeOperation(that);
    shared actual default Result transformOpenBound(OpenBound that) => transformBound(that);
    shared actual default Result transformOperation(Operation that) => transformValueExpression(that);
    shared actual default Result transformOptionalType(OptionalType that) => transformPrimaryType(that);
    shared actual default Result transformOrAssignmentOperation(OrAssignmentOperation that) => transformLogicalAssignmentOperation(that);
    shared actual default Result transformOrOperation(OrOperation that) => transformLogicalOperation(that);
    shared actual default Result transformOuter(Outer that) => transformSelfReference(that);
    shared actual default Result transformPackage(Package that) => transformSelfReference(that);
    shared actual default Result transformPackageDec(PackageDec that) => transformDec(that);
    shared actual default Result transformParameter(Parameter that) => transformNode(that);
    shared actual default Result transformParameterReference(ParameterReference that) => transformRequiredParameter(that);
    shared actual default Result transformParameters(Parameters that) => transformExpressionIsh(that);
    shared actual default Result transformPositionalArguments(PositionalArguments that) => transformArguments(that);
    shared actual default Result transformPostfixDecrementOperation(PostfixDecrementOperation that) => transformPostfixOperation(that);
    shared actual default Result transformPostfixIncrementOperation(PostfixIncrementOperation that) => transformPostfixOperation(that);
    shared actual default Result transformPostfixOperation(PostfixOperation that) => transformUnaryOperation(that);
    shared actual default Result transformPrefixDecrementOperation(PrefixDecrementOperation that) => transformPrefixOperation(that);
    shared actual default Result transformPrefixIncrementOperation(PrefixIncrementOperation that) => transformPrefixOperation(that);
    shared actual default Result transformPrefixOperation(PrefixOperation that) => transformUnaryOperation(that);
    shared actual default Result transformPrimary(Primary that) => transformValueExpression(that);
    shared actual default Result transformPrimaryType(PrimaryType that) => transformUnionableType(that);
    shared actual default Result transformProductOperation(ProductOperation that) => transformArithmeticOperation(that);
    shared actual default Result transformQualifiedExpression(QualifiedExpression that) => transformPrimary(that);
    shared actual default Result transformQualifiedType(QualifiedType that) => transformSimpleType(that);
    shared actual default Result transformQuotientOperation(QuotientOperation that) => transformArithmeticOperation(that);
    shared actual default Result transformRemainderAssignmentOperation(RemainderAssignmentOperation that) => transformArithmeticAssignmentOperation(that);
    shared actual default Result transformRemainderOperation(RemainderOperation that) => transformArithmeticOperation(that);
    shared actual default Result transformRequiredParameter(RequiredParameter that) => transformParameter(that);
    shared actual default Result transformScaleOperation(ScaleOperation that) => transformBinaryOperation(that);
    shared actual default Result transformSelfReference(SelfReference that) => transformExpression(that);
    shared actual default Result transformSequentialType(SequentialType that) => transformPrimaryType(that);
    shared actual default Result transformSetAssignmentOperation(SetAssignmentOperation that) => transformAssignmentOperation(that);
    shared actual default Result transformSetOperation(SetOperation that) => transformBinaryOperation(that);
    shared actual default Result transformSimpleType(SimpleType that) => transformPrimaryType(that);
    shared actual default Result transformSmallAsOperation(SmallAsOperation that) => transformComparisonOperation(that);
    shared actual default Result transformSmallerOperation(SmallerOperation that) => transformComparisonOperation(that);
    shared actual default Result transformSpanOperation(SpanOperation that) => transformBinaryOperation(that);
    shared actual default Result transformSpecification(Specification that) => transformStatement(that);
    shared actual default Result transformSpecifiedArgument(SpecifiedArgument that) => transformNamedArgument(that);
    shared actual default Result transformSpecifier(Specifier that) => transformNode(that);
    shared actual default Result transformSpreadArgument(SpreadArgument that) => transformExpressionIsh(that);
    shared actual default Result transformStatement(Statement that) => transformNode(that);
    shared actual default Result transformStringLiteral(StringLiteral that) => transformLiteral(that);
    shared actual default Result transformSubtractAssignmentOperation(SubtractAssignmentOperation that) => transformArithmeticAssignmentOperation(that);
    shared actual default Result transformSumOperation(SumOperation that) => transformArithmeticOperation(that);
    shared actual default Result transformSuper(Super that) => transformSelfReference(that);
    shared actual default Result transformThenOperation(ThenOperation that) => transformBinaryOperation(that);
    shared actual default Result transformThis(This that) => transformSelfReference(that);
    shared actual default Result transformTuple(Tuple that) => transformAtom(that);
    shared actual default Result transformTupleType(TupleType that) => transformPrimaryType(that);
    shared actual default Result transformType(Type that) => transformTypeIsh(that);
    shared actual default Result transformTypeDec(TypeDec that) => transformDec(that);
    shared actual default Result transformTypeIsh(TypeIsh that) => transformExpressionIsh(that);
    shared actual default Result transformTypeList(TypeList that) => transformTypeIsh(that);
    shared actual default Result transformTypeMeta(TypeMeta that) => transformMeta(that);
    shared actual default Result transformTypeNameWithTypeArguments(TypeNameWithTypeArguments that) => transformNameWithTypeArguments(that);
    shared actual default Result transformUIdentifier(UIdentifier that) => transformIdentifier(that);
    shared actual default Result transformUnaryArithmeticOperation(UnaryArithmeticOperation that) => transformUnaryOperation(that);
    shared actual default Result transformUnaryIshOperation(UnaryIshOperation that) => transformOperation(that);
    shared actual default Result transformUnaryOperation(UnaryOperation that) => transformUnaryIshOperation(that);
    shared actual default Result transformUnaryTypeOperation(UnaryTypeOperation that) => transformUnaryIshOperation(that);
    shared actual default Result transformUnionAssignmentOperation(UnionAssignmentOperation that) => transformSetAssignmentOperation(that);
    shared actual default Result transformUnionOperation(UnionOperation that) => transformSetOperation(that);
    shared actual default Result transformUnionType(UnionType that) => transformMainType(that);
    shared actual default Result transformUnionableType(UnionableType that) => transformMainType(that);
    shared actual default Result transformValueExpression(ValueExpression that) => transformExpression(that);
    shared actual default Result transformValueModifier(ValueModifier that) => transformModifier(that);
    shared actual default Result transformValueParameter(ValueParameter that) => transformRequiredParameter(that);
    shared actual default Result transformValueSpecification(ValueSpecification that) => transformSpecification(that);
    shared actual default Result transformVariadicParameter(VariadicParameter that) => transformParameter(that);
    shared actual default Result transformVariadicType(VariadicType that) => transformTypeIsh(that);
    shared actual default Result transformVoidModifier(VoidModifier that) => transformModifier(that);
    shared actual default Result transformWithinOperation(WithinOperation that) => transformOperation(that);
}
