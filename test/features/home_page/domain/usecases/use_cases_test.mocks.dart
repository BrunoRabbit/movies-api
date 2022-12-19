// Mocks generated by Mockito 5.3.2 from annotations
// in movies_api/test/features/home_page/domain/usecases/use_cases_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:movies_api/core/utils/exports.dart' as _i2;
import 'package:movies_api/features/home_page/domain/entities/config.dart'
    as _i5;
import 'package:movies_api/features/home_page/domain/entities/movie.dart'
    as _i6;
import 'package:movies_api/features/home_page/domain/entities/trending.dart'
    as _i7;
import 'package:movies_api/features/home_page/domain/repositories/api_repository.dart'
    as _i3;

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

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [ApiRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockApiRepository extends _i1.Mock implements _i3.ApiRepository {
  MockApiRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i2.Failure, _i5.Config>> getConfigurationApi() =>
      (super.noSuchMethod(
        Invocation.method(
          #getConfigurationApi,
          [],
        ),
        returnValue: _i4.Future<_i2.Either<_i2.Failure, _i5.Config>>.value(
            _FakeEither_0<_i2.Failure, _i5.Config>(
          this,
          Invocation.method(
            #getConfigurationApi,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i2.Failure, _i5.Config>>);
  @override
  _i4.Future<_i2.Either<_i2.Failure, _i6.Movie>> getPopularMovies() =>
      (super.noSuchMethod(
        Invocation.method(
          #getPopularMovies,
          [],
        ),
        returnValue: _i4.Future<_i2.Either<_i2.Failure, _i6.Movie>>.value(
            _FakeEither_0<_i2.Failure, _i6.Movie>(
          this,
          Invocation.method(
            #getPopularMovies,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i2.Failure, _i6.Movie>>);
  @override
  _i4.Future<_i2.Either<_i2.Failure, _i7.Trending>> getTrendingApi() =>
      (super.noSuchMethod(
        Invocation.method(
          #getTrendingApi,
          [],
        ),
        returnValue: _i4.Future<_i2.Either<_i2.Failure, _i7.Trending>>.value(
            _FakeEither_0<_i2.Failure, _i7.Trending>(
          this,
          Invocation.method(
            #getTrendingApi,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i2.Failure, _i7.Trending>>);
}
