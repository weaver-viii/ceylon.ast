"A [[Transformer]] with the default operation to widen the type of the visited subject:
 [[transformLIdentifier]] delegates to [[transformIdentifier]], which in turn delegates to
 [[transformNode]], which ([[Node]] being without a superclass) is the only `formal` method left."
see (`interface Visitor`)
shared interface WideningTransformer<out Result> satisfies Transformer<Result> {
    shared actual default Result transformAddAssignmentOperation(AddAssignmentOperation that) => transformArithmeticAssignmentOperation(that);
    shared actual default Result transformAliasDec(AliasDec that) => transformTypeDec(that);
    shared actual default Result transformAndAssignmentOperation(AndAssignmentOperation that) => transformLogicalAssignmentOperation(that);
    shared actual default Result transformAndOperation(AndOperation that) => transformLogicalOperation(that);
    shared actual default Result transformAnnotation(Annotation that) => transformNode(that);
    shared actual default Result transformAnnotations(Annotations that) => transformNode(that);
    shared actual default Result transformAnonymousArgument(AnonymousArgument that) => transformNamedArgument(that);
    shared actual default Result transformAnyClass(AnyClass that) => transformClassOrInterface(that);
    shared actual default Result transformAnyCompilationUnit(AnyCompilationUnit that) => transformNode(that);
    shared actual default Result transformAnyFunction(AnyFunction that) => transformTypedDeclaration(that);
    shared actual default Result transformAnyInterface(AnyInterface that) => transformClassOrInterface(that);
    shared actual default Result transformAnyInterfaceDefinition(AnyInterfaceDefinition that) => transformAnyInterface(that);
    shared actual default Result transformAnyMemberOperator(AnyMemberOperator that) => transformNode(that);
    shared actual default Result transformAnyValue(AnyValue that) => transformTypedDeclaration(that);
    shared actual default Result transformAnySpecifier(AnySpecifier that) => transformNode(that);
    shared actual default Result transformArgumentList(ArgumentList that) => transformNode(that);
    shared actual default Result transformArguments(Arguments that) => transformNode(that);
    shared actual default Result transformArithmeticAssignmentOperation(ArithmeticAssignmentOperation that) => transformAssignmentOperation(that);
    shared actual default Result transformArithmeticOperation(ArithmeticOperation that) => transformBinaryOperation(that);
    shared actual default Result transformAssertion(Assertion that) => transformStatement(that);
    shared actual default Result transformAssignOperation(AssignOperation that) => transformAssignmentOperation(that);
    shared actual default Result transformAssignmentOperation(AssignmentOperation that) => transformBinaryOperation(that);
    shared actual default Result transformAssignmentStatement(AssignmentStatement that) => transformExpressionStatement(that);
    shared actual default Result transformAtom(Atom that) => transformPrimary(that);
    shared actual default Result transformBaseExpression(BaseExpression that) => transformPrimary(that);
    shared actual default Result transformBaseMeta(BaseMeta that) => transformMeta(that);
    shared actual default Result transformBaseType(BaseType that) => transformSimpleType(that);
    shared actual default Result transformBinaryOperation(BinaryOperation that) => transformOperation(that);
    shared actual default Result transformBlock(Block that) => transformBody(that);
    shared actual default Result transformBody(Body that) => transformNode(that);
    shared actual default Result transformBooleanCondition(BooleanCondition that) => transformCondition(that);
    shared actual default Result transformBound(Bound that) => transformNode(that);
    shared actual default Result transformBreak(Break that) => transformDirective(that);
    shared actual default Result transformCallableParameter(CallableParameter that) => transformRequiredParameter(that);
    shared actual default Result transformCallableType(CallableType that) => transformPrimaryType(that);
    shared actual default Result transformCaseClause(CaseClause that) => transformNode(that);
    shared actual default Result transformCaseExpression(CaseExpression that) => transformNode(that);
    shared actual default Result transformCaseItem(CaseItem that) => transformNode(that);
    shared actual default Result transformCaseTypes(CaseTypes that) => transformNode(that);
    shared actual default Result transformCatchClause(CatchClause that) => transformNode(that);
    shared actual default Result transformCharacterLiteral(CharacterLiteral that) => transformLiteral(that);
    shared actual default Result transformClassAliasDefinition(ClassAliasDefinition that) => transformAnyClass(that);
    shared actual default Result transformClassBody(ClassBody that) => transformBody(that);
    shared actual default Result transformClassDec(ClassDec that) => transformTypeDec(that);
    shared actual default Result transformClassDefinition(ClassDefinition that) => transformAnyClass(that);
    shared actual default Result transformClassOrInterface(ClassOrInterface that) => transformTypeDeclaration(that);
    shared actual default Result transformClassSpecifier(ClassSpecifier that) => transformNode(that);
    shared actual default Result transformClosedBound(ClosedBound that) => transformBound(that);
    shared actual default Result transformCompareOperation(CompareOperation that) => transformBinaryOperation(that);
    shared actual default Result transformComparisonOperation(ComparisonOperation that) => transformBinaryOperation(that);
    shared actual default Result transformCompilationUnit(CompilationUnit that) => transformAnyCompilationUnit(that);
    shared actual default Result transformComplementAssignmentOperation(ComplementAssignmentOperation that) => transformSetAssignmentOperation(that);
    shared actual default Result transformComplementOperation(ComplementOperation that) => transformSetOperation(that);
    shared actual default Result transformComprehension(Comprehension that) => transformNode(that);
    shared actual default Result transformComprehensionClause(ComprehensionClause that) => transformNode(that);
    shared actual default Result transformCondition(Condition that) => transformNode(that);
    shared actual default Result transformConditionalExpression(ConditionalExpression that) => transformExpression(that);
    shared actual default Result transformConditions(Conditions that) => transformNode(that);
    shared actual default Result transformConstruction(Construction that) => transformExtensionOrConstruction(that);
    shared actual default Result transformConstructorDec(ConstructorDec that) => transformDec(that);
    shared actual default Result transformConstructorDefinition(ConstructorDefinition that) => transformDeclaration(that);
    shared actual default Result transformContinue(Continue that) => transformDirective(that);
    shared actual default Result transformControlStructure(ControlStructure that) => transformStatement(that);
    shared actual default Result transformDec(Dec that) => transformPrimary(that);
    shared actual default Result transformDecQualifier(DecQualifier that) => transformNode(that);
    shared actual default Result transformDeclaration(Declaration that) => transformNode(that);
    shared actual default Result transformDefaultedCallableParameter(DefaultedCallableParameter that) => transformDefaultedParameter(that);
    shared actual default Result transformDefaultedParameter(DefaultedParameter that) => transformParameter(that);
    shared actual default Result transformDefaultedParameterReference(DefaultedParameterReference that) => transformDefaultedParameter(that);
    shared actual default Result transformDefaultedType(DefaultedType that) => transformTypeIsh(that);
    shared actual default Result transformDefaultedValueParameter(DefaultedValueParameter that) => transformDefaultedParameter(that);
    shared actual default Result transformDestructure(Destructure that) => transformStatement(that);
    shared actual default Result transformDifferenceOperation(DifferenceOperation that) => transformArithmeticOperation(that);
    shared actual default Result transformDirective(Directive that) => transformStatement(that);
    shared actual default Result transformDivideAssignmentOperation(DivideAssignmentOperation that) => transformArithmeticAssignmentOperation(that);
    shared actual default Result transformDynamicBlock(DynamicBlock that) => transformControlStructure(that);
    shared actual default Result transformDynamicInterfaceDefinition(DynamicInterfaceDefinition that) => transformAnyInterfaceDefinition(that);
    shared actual default Result transformDynamicModifier(DynamicModifier that) => transformTypeModifier(that);
    shared actual default Result transformDynamicValue(DynamicValue that) => transformAtom(that);
    shared actual default Result transformElementOrSubrangeExpression(ElementOrSubrangeExpression that) => transformPrimary(that);
    shared actual default Result transformElseClause(ElseClause that) => transformNode(that);
    shared actual default Result transformElseOperation(ElseOperation that) => transformBinaryOperation(that);
    shared actual default Result transformEntryOperation(EntryOperation that) => transformBinaryOperation(that);
    shared actual default Result transformEntryPattern(EntryPattern that) => transformPattern(that);
    shared actual default Result transformEntryType(EntryType that) => transformType(that);
    shared actual default Result transformEqualOperation(EqualOperation that) => transformEqualityOperation(that);
    shared actual default Result transformEqualityOperation(EqualityOperation that) => transformBinaryOperation(that);
    shared actual default Result transformExistsCondition(ExistsCondition that) => transformExistsOrNonemptyCondition(that);
    shared actual default Result transformExistsOperation(ExistsOperation that) => transformUnaryOperation(that);
    shared actual default Result transformExistsOrNonemptyCondition(ExistsOrNonemptyCondition that) => transformCondition(that);
    shared actual default Result transformExponentiationOperation(ExponentiationOperation that) => transformArithmeticOperation(that);
    shared actual default Result transformExpression(Expression that) => transformNode(that);
    shared actual default Result transformExpressionComprehensionClause(ExpressionComprehensionClause that) => transformComprehensionClause(that);
    shared actual default Result transformExpressionStatement(ExpressionStatement that) => transformStatement(that);
    shared actual default Result transformExtendedType(ExtendedType that) => transformNode(that);
    shared actual default Result transformExtension(Extension that) => transformExtensionOrConstruction(that);
    shared actual default Result transformExtensionOrConstruction(ExtensionOrConstruction that) => transformNode(that);
    shared actual default Result transformFailClause(FailClause that) => transformNode(that);
    shared actual default Result transformFinallyClause(FinallyClause that) => transformNode(that);
    shared actual default Result transformFloatLiteral(FloatLiteral that) => transformLiteral(that);
    shared actual default Result transformForClause(ForClause that) => transformNode(that);
    shared actual default Result transformForComprehensionClause(ForComprehensionClause that) => transformInitialComprehensionClause(that);
    shared actual default Result transformForFail(ForFail that) => transformControlStructure(that);
    shared actual default Result transformForIterator(ForIterator that) => transformNode(that);
    shared actual default Result transformFullPackageName(FullPackageName that) => transformNode(that);
    shared actual default Result transformFunctionArgument(FunctionArgument that) => transformInlineDefinitionArgument(that);
    shared actual default Result transformFunctionDec(FunctionDec that) => transformMemberDec(that);
    shared actual default Result transformFunctionDeclaration(FunctionDeclaration that) => transformAnyFunction(that);
    shared actual default Result transformFunctionDefinition(FunctionDefinition that) => transformAnyFunction(that);
    shared actual default Result transformFunctionExpression(FunctionExpression that) => transformExpression(that);
    shared actual default Result transformFunctionModifier(FunctionModifier that) => transformLocalModifier(that);
    shared actual default Result transformFunctionShortcutDefinition(FunctionShortcutDefinition that) => transformAnyFunction(that);
    shared actual default Result transformGivenDec(GivenDec that) => transformTypeDec(that);
    shared actual default Result transformGroupedExpression(GroupedExpression that) => transformAtom(that);
    shared actual default Result transformGroupedType(GroupedType that) => transformPrimaryType(that);
    shared actual default Result transformIdenticalOperation(IdenticalOperation that) => transformEqualityOperation(that);
    shared actual default Result transformIdentifier(Identifier that) => transformNode(that);
    shared actual default Result transformIdentityOperation(IdentityOperation that) => transformUnaryArithmeticOperation(that);
    shared actual default Result transformIfClause(IfClause that) => transformNode(that);
    shared actual default Result transformIfComprehensionClause(IfComprehensionClause that) => transformInitialComprehensionClause(that);
    shared actual default Result transformIfElse(IfElse that) => transformControlStructure(that);
    shared actual default Result transformIfElseExpression(IfElseExpression that) => transformConditionalExpression(that);
    shared actual default Result transformImport(Import that) => transformNode(that);
    shared actual default Result transformImportAlias(ImportAlias that) => transformNode(that);
    shared actual default Result transformImportElement(ImportElement that) => transformNode(that);
    shared actual default Result transformImportElements(ImportElements that) => transformNode(that);
    shared actual default Result transformImportFunctionValueAlias(ImportFunctionValueAlias that) => transformImportAlias(that);
    shared actual default Result transformImportFunctionValueElement(ImportFunctionValueElement that) => transformImportElement(that);
    shared actual default Result transformImportTypeAlias(ImportTypeAlias that) => transformImportAlias(that);
    shared actual default Result transformImportTypeElement(ImportTypeElement that) => transformImportElement(that);
    shared actual default Result transformImportWildcard(ImportWildcard that) => transformNode(that);
    shared actual default Result transformInModifier(InModifier that) => transformVariance(that);
    shared actual default Result transformInOperation(InOperation that) => transformBinaryOperation(that);
    shared actual default Result transformInitialComprehensionClause(InitialComprehensionClause that) => transformComprehensionClause(that);
    shared actual default Result transformInlineDefinitionArgument(InlineDefinitionArgument that) => transformNamedArgument(that);
    shared actual default Result transformIntegerLiteral(IntegerLiteral that) => transformLiteral(that);
    shared actual default Result transformInterfaceAliasDefinition(InterfaceAliasDefinition that) => transformAnyInterface(that);
    shared actual default Result transformInterfaceBody(InterfaceBody that) => transformBody(that);
    shared actual default Result transformInterfaceDec(InterfaceDec that) => transformTypeDec(that);
    shared actual default Result transformInterfaceDefinition(InterfaceDefinition that) => transformAnyInterfaceDefinition(that);
    shared actual default Result transformIntersectAssignmentOperation(IntersectAssignmentOperation that) => transformSetAssignmentOperation(that);
    shared actual default Result transformIntersectionOperation(IntersectionOperation that) => transformBinaryOperation(that);
    shared actual default Result transformIntersectionType(IntersectionType that) => transformUnionableType(that);
    shared actual default Result transformInvocation(Invocation that) => transformPrimary(that);
    shared actual default Result transformInvocationStatement(InvocationStatement that) => transformExpressionStatement(that);
    shared actual default Result transformIsCase(IsCase that) => transformCaseItem(that);
    shared actual default Result transformIsCondition(IsCondition that) => transformCondition(that);
    shared actual default Result transformIsOperation(IsOperation that) => transformUnaryTypeOperation(that);
    shared actual default Result transformIterable(Iterable that) => transformAtom(that);
    shared actual default Result transformIterableType(IterableType that) => transformPrimaryType(that);
    shared actual default Result transformKeySubscript(KeySubscript that) => transformSubscript(that);
    shared actual default Result transformLIdentifier(LIdentifier that) => transformIdentifier(that);
    shared actual default Result transformLargeAsOperation(LargeAsOperation that) => transformComparisonOperation(that);
    shared actual default Result transformLargerOperation(LargerOperation that) => transformComparisonOperation(that);
    shared actual default Result transformLazySpecification(LazySpecification that) => transformSpecification(that);
    shared actual default Result transformLazySpecifier(LazySpecifier that) => transformAnySpecifier(that);
    shared actual default Result transformLetExpression(LetExpression that) => transformExpression(that);
    shared actual default Result transformLiteral(Literal that) => transformAtom(that);
    shared actual default Result transformLocalModifier(LocalModifier that) => transformTypeModifier(that);
    shared actual default Result transformLogicalAssignmentOperation(LogicalAssignmentOperation that) => transformAssignmentOperation(that);
    shared actual default Result transformLogicalOperation(LogicalOperation that) => transformBinaryOperation(that);
    shared actual default Result transformMainType(MainType that) => transformType(that);
    shared actual default Result transformMatchCase(MatchCase that) => transformCaseItem(that);
    shared actual default Result transformMeasureOperation(MeasureOperation that) => transformBinaryOperation(that);
    shared actual default Result transformMeasureSubscript(MeasureSubscript that) => transformRangeSubscript(that);
    shared actual default Result transformMemberDec(MemberDec that) => transformDec(that);
    shared actual default Result transformMemberMeta(MemberMeta that) => transformMeta(that);
    shared actual default Result transformMemberNameWithTypeArguments(MemberNameWithTypeArguments that) => transformNameWithTypeArguments(that);
    shared actual default Result transformMemberOperator(MemberOperator that) => transformAnyMemberOperator(that);
    shared actual default Result transformMeta(Meta that) => transformPrimary(that);
    shared actual default Result transformModifier(Modifier that) => transformNode(that);
    shared actual default Result transformModuleBody(ModuleBody that) => transformNode(that);
    shared actual default Result transformModuleCompilationUnit(ModuleCompilationUnit that) => transformAnyCompilationUnit(that);
    shared actual default Result transformModuleDec(ModuleDec that) => transformDec(that);
    shared actual default Result transformModuleDescriptor(ModuleDescriptor that) => transformNode(that);
    shared actual default Result transformModuleImport(ModuleImport that) => transformNode(that);
    shared actual default Result transformMultiplyAssignmentOperation(MultiplyAssignmentOperation that) => transformArithmeticAssignmentOperation(that);
    shared actual default Result transformNameWithTypeArguments(NameWithTypeArguments that) => transformTypeIsh(that);
    shared actual default Result transformNamedArgument(NamedArgument that) => transformNode(that);
    shared actual default Result transformNamedArguments(NamedArguments that) => transformArguments(that);
    shared actual default Result transformNegationOperation(NegationOperation that) => transformUnaryArithmeticOperation(that);
    shared actual default Result transformNonemptyCondition(NonemptyCondition that) => transformExistsOrNonemptyCondition(that);
    shared actual default Result transformNonemptyOperation(NonemptyOperation that) => transformUnaryOperation(that);
    shared actual default Result transformNotEqualOperation(NotEqualOperation that) => transformEqualityOperation(that);
    shared actual default Result transformNotOperation(NotOperation that) => transformUnaryOperation(that);
    shared actual default Result transformObjectArgument(ObjectArgument that) => transformInlineDefinitionArgument(that);
    shared actual default Result transformObjectDefinition(ObjectDefinition that) => transformDeclaration(that);
    shared actual default Result transformObjectExpression(ObjectExpression that) => transformAtom(that);
    shared actual default Result transformOfOperation(OfOperation that) => transformUnaryTypeOperation(that);
    shared actual default Result transformOpenBound(OpenBound that) => transformBound(that);
    shared actual default Result transformOperation(Operation that) => transformValueExpression(that);
    shared actual default Result transformOptionalType(OptionalType that) => transformPrimaryType(that);
    shared actual default Result transformOrAssignmentOperation(OrAssignmentOperation that) => transformLogicalAssignmentOperation(that);
    shared actual default Result transformOrOperation(OrOperation that) => transformLogicalOperation(that);
    shared actual default Result transformOutModifier(OutModifier that) => transformVariance(that);
    shared actual default Result transformOuter(Outer that) => transformSelfReference(that);
    shared actual default Result transformPackage(Package that) => transformSelfReference(that);
    shared actual default Result transformPackageCompilationUnit(PackageCompilationUnit that) => transformAnyCompilationUnit(that);
    shared actual default Result transformPackageDec(PackageDec that) => transformDec(that);
    shared actual default Result transformPackageDescriptor(PackageDescriptor that) => transformNode(that);
    shared actual default Result transformPackageQualifier(PackageQualifier that) => transformTypeIsh(that);
    shared actual default Result transformParameter(Parameter that) => transformNode(that);
    shared actual default Result transformParameterReference(ParameterReference that) => transformRequiredParameter(that);
    shared actual default Result transformParameters(Parameters that) => transformNode(that);
    shared actual default Result transformPattern(Pattern that) => transformNode(that);
    shared actual default Result transformPatternList(PatternList that) => transformNode(that);
    shared actual default Result transformPositionalArguments(PositionalArguments that) => transformArguments(that);
    shared actual default Result transformPostfixDecrementOperation(PostfixDecrementOperation that) => transformPostfixOperation(that);
    shared actual default Result transformPostfixIncrementOperation(PostfixIncrementOperation that) => transformPostfixOperation(that);
    shared actual default Result transformPostfixOperation(PostfixOperation that) => transformUnaryOperation(that);
    shared actual default Result transformPrefixDecrementOperation(PrefixDecrementOperation that) => transformPrefixOperation(that);
    shared actual default Result transformPrefixIncrementOperation(PrefixIncrementOperation that) => transformPrefixOperation(that);
    shared actual default Result transformPrefixOperation(PrefixOperation that) => transformUnaryOperation(that);
    shared actual default Result transformPrefixPostfixStatement(PrefixPostfixStatement that) => transformExpressionStatement(that);
    shared actual default Result transformPrimary(Primary that) => transformValueExpression(that);
    shared actual default Result transformPrimaryType(PrimaryType that) => transformUnionableType(that);
    shared actual default Result transformProductOperation(ProductOperation that) => transformArithmeticOperation(that);
    shared actual default Result transformQualifiedExpression(QualifiedExpression that) => transformPrimary(that);
    shared actual default Result transformQualifiedType(QualifiedType that) => transformSimpleType(that);
    shared actual default Result transformQuotientOperation(QuotientOperation that) => transformArithmeticOperation(that);
    shared actual default Result transformRangeSubscript(RangeSubscript that) => transformSubscript(that);
    shared actual default Result transformRemainderAssignmentOperation(RemainderAssignmentOperation that) => transformArithmeticAssignmentOperation(that);
    shared actual default Result transformRemainderOperation(RemainderOperation that) => transformArithmeticOperation(that);
    shared actual default Result transformRequiredParameter(RequiredParameter that) => transformParameter(that);
    shared actual default Result transformResource(Resource that) => transformNode(that);
    shared actual default Result transformResources(Resources that) => transformNode(that);
    shared actual default Result transformReturn(Return that) => transformDirective(that);
    shared actual default Result transformSafeMemberOperator(SafeMemberOperator that) => transformAnyMemberOperator(that);
    shared actual default Result transformSatisfiedTypes(SatisfiedTypes that) => transformNode(that);
    shared actual default Result transformScaleOperation(ScaleOperation that) => transformBinaryOperation(that);
    shared actual default Result transformSelfReference(SelfReference that) => transformExpression(that);
    shared actual default Result transformSequentialType(SequentialType that) => transformPrimaryType(that);
    shared actual default Result transformSetAssignmentOperation(SetAssignmentOperation that) => transformAssignmentOperation(that);
    shared actual default Result transformSetOperation(SetOperation that) => transformBinaryOperation(that);
    shared actual default Result transformSimpleType(SimpleType that) => transformPrimaryType(that);
    shared actual default Result transformSmallAsOperation(SmallAsOperation that) => transformComparisonOperation(that);
    shared actual default Result transformSmallerOperation(SmallerOperation that) => transformComparisonOperation(that);
    shared actual default Result transformSpanFromSubscript(SpanFromSubscript that) => transformRangeSubscript(that);
    shared actual default Result transformSpanOperation(SpanOperation that) => transformBinaryOperation(that);
    shared actual default Result transformSpanSubscript(SpanSubscript that) => transformRangeSubscript(that);
    shared actual default Result transformSpanToSubscript(SpanToSubscript that) => transformRangeSubscript(that);
    shared actual default Result transformSpecification(Specification that) => transformStatement(that);
    shared actual default Result transformSpecifiedArgument(SpecifiedArgument that) => transformNamedArgument(that);
    shared actual default Result transformSpecifiedPattern(SpecifiedPattern that) => transformNode(that);
    shared actual default Result transformSpecifiedVariable(SpecifiedVariable that) => transformVariable(that);
    shared actual default Result transformSpecifier(Specifier that) => transformNode(that);
    shared actual default Result transformSpreadArgument(SpreadArgument that) => transformNode(that);
    shared actual default Result transformSpreadMemberOperator(SpreadMemberOperator that) => transformAnyMemberOperator(that);
    shared actual default Result transformSpreadType(SpreadType that) => transformTypeIsh(that);
    shared actual default Result transformStatement(Statement that) => transformNode(that);
    shared actual default Result transformStringLiteral(StringLiteral that) => transformLiteral(that);
    shared actual default Result transformStringTemplate(StringTemplate that) => transformAtom(that);
    shared actual default Result transformSubscript(Subscript that) => transformNode(that);
    shared actual default Result transformSubtractAssignmentOperation(SubtractAssignmentOperation that) => transformArithmeticAssignmentOperation(that);
    shared actual default Result transformSumOperation(SumOperation that) => transformArithmeticOperation(that);
    shared actual default Result transformSuper(Super that) => transformSelfReference(that);
    shared actual default Result transformSwitchCaseElse(SwitchCaseElse that) => transformControlStructure(that);
    shared actual default Result transformSwitchCaseElseExpression(SwitchCaseElseExpression that) => transformConditionalExpression(that);
    shared actual default Result transformSwitchCases(SwitchCases that) => transformNode(that);
    shared actual default Result transformSwitchClause(SwitchClause that) => transformNode(that);
    shared actual default Result transformThenOperation(ThenOperation that) => transformBinaryOperation(that);
    shared actual default Result transformThis(This that) => transformSelfReference(that);
    shared actual default Result transformThrow(Throw that) => transformDirective(that);
    shared actual default Result transformTryCatchFinally(TryCatchFinally that) => transformControlStructure(that);
    shared actual default Result transformTryClause(TryClause that) => transformNode(that);
    shared actual default Result transformTuple(Tuple that) => transformAtom(that);
    shared actual default Result transformTuplePattern(TuplePattern that) => transformPattern(that);
    shared actual default Result transformListTupleType(ListTupleType that) => transformPrimaryType(that);
    shared actual default Result transformType(Type that) => transformTypeIsh(that);
    shared actual default Result transformTypeAliasDefinition(TypeAliasDefinition that) => transformTypeDeclaration(that);
    shared actual default Result transformTypeArgument(TypeArgument that) => transformTypeIsh(that);
    shared actual default Result transformTypeArguments(TypeArguments that) => transformTypeIsh(that);
    shared actual default Result transformTypeConstraint(TypeConstraint that) => transformNode(that);
    shared actual default Result transformTypeDec(TypeDec that) => transformDec(that);
    shared actual default Result transformTypeDeclaration(TypeDeclaration that) => transformDeclaration(that);
    shared actual default Result transformTypeIsh(TypeIsh that) => transformNode(that);
    shared actual default Result transformTypeList(TypeList that) => transformTypeIsh(that);
    shared actual default Result transformTypeMeta(TypeMeta that) => transformMeta(that);
    shared actual default Result transformTypeModifier(TypeModifier that) => transformModifier(that);
    shared actual default Result transformTypeNameWithTypeArguments(TypeNameWithTypeArguments that) => transformNameWithTypeArguments(that);
    shared actual default Result transformTypeParameter(TypeParameter that) => transformNode(that);
    shared actual default Result transformTypeParameters(TypeParameters that) => transformNode(that);
    shared actual default Result transformTypeSpecifier(TypeSpecifier that) => transformNode(that);
    shared actual default Result transformTypedDeclaration(TypedDeclaration that) => transformDeclaration(that);
    shared actual default Result transformTypedVariable(TypedVariable that) => transformVariable(that);
    shared actual default Result transformUIdentifier(UIdentifier that) => transformIdentifier(that);
    shared actual default Result transformUnaryArithmeticOperation(UnaryArithmeticOperation that) => transformUnaryOperation(that);
    shared actual default Result transformUnaryIshOperation(UnaryIshOperation that) => transformOperation(that);
    shared actual default Result transformUnaryOperation(UnaryOperation that) => transformUnaryIshOperation(that);
    shared actual default Result transformUnaryTypeOperation(UnaryTypeOperation that) => transformUnaryIshOperation(that);
    shared actual default Result transformUnionAssignmentOperation(UnionAssignmentOperation that) => transformSetAssignmentOperation(that);
    shared actual default Result transformUnionOperation(UnionOperation that) => transformSetOperation(that);
    shared actual default Result transformUnionType(UnionType that) => transformMainType(that);
    shared actual default Result transformUnionableType(UnionableType that) => transformMainType(that);
    shared actual default Result transformUnspecifiedVariable(UnspecifiedVariable that) => transformVariable(that);
    shared actual default Result transformValueArgument(ValueArgument that) => transformInlineDefinitionArgument(that);
    shared actual default Result transformValueDec(ValueDec that) => transformMemberDec(that);
    shared actual default Result transformValueDeclaration(ValueDeclaration that) => transformAnyValue(that);
    shared actual default Result transformValueDefinition(ValueDefinition that) => transformAnyValue(that);
    shared actual default Result transformValueExpression(ValueExpression that) => transformExpression(that);
    shared actual default Result transformValueGetterDefinition(ValueGetterDefinition that) => transformAnyValue(that);
    shared actual default Result transformValueModifier(ValueModifier that) => transformLocalModifier(that);
    shared actual default Result transformValueParameter(ValueParameter that) => transformRequiredParameter(that);
    shared actual default Result transformValueSetterDefinition(ValueSetterDefinition that) => transformDeclaration(that);
    shared actual default Result transformValueSpecification(ValueSpecification that) => transformSpecification(that);
    shared actual default Result transformVariable(Variable that) => transformNode(that);
    shared actual default Result transformVariablePattern(VariablePattern that) => transformPattern(that);
    shared actual default Result transformVariadicParameter(VariadicParameter that) => transformParameter(that);
    shared actual default Result transformVariadicType(VariadicType that) => transformTypeIsh(that);
    shared actual default Result transformVariadicVariable(VariadicVariable that) => transformVariable(that);
    shared actual default Result transformVariance(Variance that) => transformModifier(that);
    shared actual default Result transformVoidModifier(VoidModifier that) => transformTypeModifier(that);
    shared actual default Result transformWhile(While that) => transformControlStructure(that);
    shared actual default Result transformWithinOperation(WithinOperation that) => transformOperation(that);
}
