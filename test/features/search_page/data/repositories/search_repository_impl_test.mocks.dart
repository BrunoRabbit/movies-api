// Mocks generated by Mockito 5.3.2 from annotations
// in movies_api/test/features/search_page/data/repositories/search_repository_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;

import 'package:dartz/dartz.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;
import 'package:movies_api/core/error/failure.dart' as _i7;
import 'package:movies_api/core/network/network_status.dart' as _i2;
import 'package:movies_api/features/search_page/data/datasources/search_remote_datasources.dart'
    as _i3;
import 'package:movies_api/features/search_page/data/repositories/search_repository_impl.dart'
    as _i5;
import 'package:movies_api/features/search_page/domain/entities/search_result.dart'
    as _i8;

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

class _FakeNetworkStatus_0 extends _i1.SmartFake implements _i2.NetworkStatus {
  _FakeNetworkStatus_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeSearchRemoteDatasources_1 extends _i1.SmartFake
    implements _i3.SearchRemoteDatasources {
  _FakeSearchRemoteDatasources_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_2<L, R> extends _i1.SmartFake implements _i4.Either<L, R> {
  _FakeEither_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [SearchRepositoryImpl].
///
/// See the documentation for Mockito's code generation for more information.
class MockSearchRepositoryImpl extends _i1.Mock
    implements _i5.SearchRepositoryImpl {
  @override
  _i2.NetworkStatus get networkStatus => (super.noSuchMethod(
        Invocation.getter(#networkStatus),
        returnValue: _FakeNetworkStatus_0(
          this,
          Invocation.getter(#networkStatus),
        ),
        returnValueForMissingStub: _FakeNetworkStatus_0(
          this,
          Invocation.getter(#networkStatus),
        ),
      ) as _i2.NetworkStatus);
  @override
  _i3.SearchRemoteDatasources get searchRemoteDatasources =>
      (super.noSuchMethod(
        Invocation.getter(#searchRemoteDatasources),
        returnValue: _FakeSearchRemoteDatasources_1(
          this,
          Invocation.getter(#searchRemoteDatasources),
        ),
        returnValueForMissingStub: _FakeSearchRemoteDatasources_1(
          this,
          Invocation.getter(#searchRemoteDatasources),
        ),
      ) as _i3.SearchRemoteDatasources);
  @override
  _i6.Future<_i4.Either<_i7.Failure, _i8.SearchResult>> getSearchQuery(
          String? name) =>
      (super.noSuchMethod(
        Invocation.method(
          #getSearchQuery,
          [name],
        ),
        returnValue:
            _i6.Future<_i4.Either<_i7.Failure, _i8.SearchResult>>.value(
                _FakeEither_2<_i7.Failure, _i8.SearchResult>(
          this,
          Invocation.method(
            #getSearchQuery,
            [name],
          ),
        )),
        returnValueForMissingStub:
            _i6.Future<_i4.Either<_i7.Failure, _i8.SearchResult>>.value(
                _FakeEither_2<_i7.Failure, _i8.SearchResult>(
          this,
          Invocation.method(
            #getSearchQuery,
            [name],
          ),
        )),
      ) as _i6.Future<_i4.Either<_i7.Failure, _i8.SearchResult>>);
}