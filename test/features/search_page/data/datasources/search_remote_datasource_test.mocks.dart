// Mocks generated by Mockito 5.4.4 from annotations
// in movies_api/test/features/search_page/data/datasources/search_remote_datasource_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:http/http.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i6;
import 'package:movies_api/features/search_page/data/datasources/search_remote_datasources.dart'
    as _i4;
import 'package:movies_api/features/search_page/data/models/search_result_model.dart'
    as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
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

class _FakeResponse_1 extends _i1.SmartFake implements _i3.Response {
  _FakeResponse_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [SearchRemoteDatasources].
///
/// See the documentation for Mockito's code generation for more information.
class MockSearchRemoteDatasources extends _i1.Mock
    implements _i4.SearchRemoteDatasources {
  @override
  _i5.Future<_i2.SearchResultModel> getSearchQuery(
    String? name, {
    int? page = 1,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getSearchQuery,
          [name],
          {#page: page},
        ),
        returnValue:
            _i5.Future<_i2.SearchResultModel>.value(_FakeSearchResultModel_0(
          this,
          Invocation.method(
            #getSearchQuery,
            [name],
            {#page: page},
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i2.SearchResultModel>.value(_FakeSearchResultModel_0(
          this,
          Invocation.method(
            #getSearchQuery,
            [name],
            {#page: page},
          ),
        )),
      ) as _i5.Future<_i2.SearchResultModel>);
}

/// A class which mocks [SearchRemoteDatasourcesImpl].
///
/// See the documentation for Mockito's code generation for more information.
class MockSearchRemoteDatasourcesImpl extends _i1.Mock
    implements _i4.SearchRemoteDatasourcesImpl {
  @override
  String get key => (super.noSuchMethod(
        Invocation.getter(#key),
        returnValue: _i6.dummyValue<String>(
          this,
          Invocation.getter(#key),
        ),
        returnValueForMissingStub: _i6.dummyValue<String>(
          this,
          Invocation.getter(#key),
        ),
      ) as String);

  @override
  _i3.Response get response => (super.noSuchMethod(
        Invocation.getter(#response),
        returnValue: _FakeResponse_1(
          this,
          Invocation.getter(#response),
        ),
        returnValueForMissingStub: _FakeResponse_1(
          this,
          Invocation.getter(#response),
        ),
      ) as _i3.Response);

  @override
  set response(_i3.Response? _response) => super.noSuchMethod(
        Invocation.setter(
          #response,
          _response,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i5.Future<_i2.SearchResultModel> getSearchQuery(
    String? name, {
    int? page = 1,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getSearchQuery,
          [name],
          {#page: page},
        ),
        returnValue:
            _i5.Future<_i2.SearchResultModel>.value(_FakeSearchResultModel_0(
          this,
          Invocation.method(
            #getSearchQuery,
            [name],
            {#page: page},
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i2.SearchResultModel>.value(_FakeSearchResultModel_0(
          this,
          Invocation.method(
            #getSearchQuery,
            [name],
            {#page: page},
          ),
        )),
      ) as _i5.Future<_i2.SearchResultModel>);
}
