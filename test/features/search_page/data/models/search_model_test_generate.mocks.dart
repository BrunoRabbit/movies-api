// Mocks generated by Mockito 5.3.2 from annotations
// in movies_api/test/features/search_page/data/models/search_model_test_generate.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:mockito/mockito.dart' as _i1;
import 'package:movies_api/features/search_page/data/models/search_result_model.dart'
    as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeSearchResultModel_0 extends _i1.SmartFake
    implements _i2.SearchResultModel {
  _FakeSearchResultModel_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [SearchResultModel].
///
/// See the documentation for Mockito's code generation for more information.
class MockSearchResultModel extends _i1.Mock implements _i2.SearchResultModel {
  @override
  List<Object?> get props => (super.noSuchMethod(
        Invocation.getter(#props),
        returnValue: <Object?>[],
        returnValueForMissingStub: <Object?>[],
      ) as List<Object?>);
  @override
  Map<String, dynamic> toMap() => (super.noSuchMethod(
        Invocation.method(
          #toMap,
          [],
        ),
        returnValue: <String, dynamic>{},
        returnValueForMissingStub: <String, dynamic>{},
      ) as Map<String, dynamic>);
  @override
  String toJson() => (super.noSuchMethod(
        Invocation.method(
          #toJson,
          [],
        ),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);
  @override
  _i2.SearchResultModel wrapperFromMap(Map<String, dynamic>? map) =>
      (super.noSuchMethod(
        Invocation.method(
          #wrapperFromMap,
          [map],
        ),
        returnValue: _FakeSearchResultModel_0(
          this,
          Invocation.method(
            #wrapperFromMap,
            [map],
          ),
        ),
        returnValueForMissingStub: _FakeSearchResultModel_0(
          this,
          Invocation.method(
            #wrapperFromMap,
            [map],
          ),
        ),
      ) as _i2.SearchResultModel);
  @override
  _i2.SearchResultModel wrapperFromJson(String? source) => (super.noSuchMethod(
        Invocation.method(
          #wrapperFromJson,
          [source],
        ),
        returnValue: _FakeSearchResultModel_0(
          this,
          Invocation.method(
            #wrapperFromJson,
            [source],
          ),
        ),
        returnValueForMissingStub: _FakeSearchResultModel_0(
          this,
          Invocation.method(
            #wrapperFromJson,
            [source],
          ),
        ),
      ) as _i2.SearchResultModel);
}
