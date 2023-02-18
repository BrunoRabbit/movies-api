// Mocks generated by Mockito 5.3.2 from annotations
// in movies_api/test/features/home_page/data/repositories/api_repository_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:mockito/mockito.dart' as _i1;
import 'package:movies_api/core/network/network_status.dart' as _i3;
import 'package:movies_api/core/utils/exports.dart' as _i2;
import 'package:movies_api/features/home_page/data/repositories/api_repository_impl.dart'
    as _i4;
import 'package:movies_api/features/home_page/domain/entities/config.dart'
    as _i6;
import 'package:movies_api/features/home_page/domain/entities/movie.dart'
    as _i7;
import 'package:movies_api/features/home_page/domain/entities/movie_in_theater.dart'
    as _i10;
import 'package:movies_api/features/home_page/domain/entities/top_rated.dart'
    as _i9;
import 'package:movies_api/features/home_page/domain/entities/trending.dart'
    as _i8;
import 'package:movies_api/features/home_page/domain/entities/upcoming_movie.dart'
    as _i11;

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

class _FakeApiRepositoryRemoteDataSource_0 extends _i1.SmartFake
    implements _i2.ApiRepositoryRemoteDataSource {
  _FakeApiRepositoryRemoteDataSource_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeNetworkStatus_1 extends _i1.SmartFake implements _i3.NetworkStatus {
  _FakeNetworkStatus_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_2<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [ApiRepositoryImpl].
///
/// See the documentation for Mockito's code generation for more information.
class MockApiRepositoryImpl extends _i1.Mock implements _i4.ApiRepositoryImpl {
  @override
  _i2.ApiRepositoryRemoteDataSource get remoteApiRepository =>
      (super.noSuchMethod(
        Invocation.getter(#remoteApiRepository),
        returnValue: _FakeApiRepositoryRemoteDataSource_0(
          this,
          Invocation.getter(#remoteApiRepository),
        ),
        returnValueForMissingStub: _FakeApiRepositoryRemoteDataSource_0(
          this,
          Invocation.getter(#remoteApiRepository),
        ),
      ) as _i2.ApiRepositoryRemoteDataSource);
  @override
  _i3.NetworkStatus get networkStatus => (super.noSuchMethod(
        Invocation.getter(#networkStatus),
        returnValue: _FakeNetworkStatus_1(
          this,
          Invocation.getter(#networkStatus),
        ),
        returnValueForMissingStub: _FakeNetworkStatus_1(
          this,
          Invocation.getter(#networkStatus),
        ),
      ) as _i3.NetworkStatus);
  @override
  _i5.Future<_i2.Either<_i2.Failure, _i6.Config>> getConfigurationApi() =>
      (super.noSuchMethod(
        Invocation.method(
          #getConfigurationApi,
          [],
        ),
        returnValue: _i5.Future<_i2.Either<_i2.Failure, _i6.Config>>.value(
            _FakeEither_2<_i2.Failure, _i6.Config>(
          this,
          Invocation.method(
            #getConfigurationApi,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i2.Either<_i2.Failure, _i6.Config>>.value(
                _FakeEither_2<_i2.Failure, _i6.Config>(
          this,
          Invocation.method(
            #getConfigurationApi,
            [],
          ),
        )),
      ) as _i5.Future<_i2.Either<_i2.Failure, _i6.Config>>);
  @override
  _i5.Future<_i2.Either<_i2.Failure, _i7.Movie>> getPopularMovies() =>
      (super.noSuchMethod(
        Invocation.method(
          #getPopularMovies,
          [],
        ),
        returnValue: _i5.Future<_i2.Either<_i2.Failure, _i7.Movie>>.value(
            _FakeEither_2<_i2.Failure, _i7.Movie>(
          this,
          Invocation.method(
            #getPopularMovies,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i2.Either<_i2.Failure, _i7.Movie>>.value(
                _FakeEither_2<_i2.Failure, _i7.Movie>(
          this,
          Invocation.method(
            #getPopularMovies,
            [],
          ),
        )),
      ) as _i5.Future<_i2.Either<_i2.Failure, _i7.Movie>>);
  @override
  _i5.Future<_i2.Either<_i2.Failure, _i8.Trending>> getTrendingApi() =>
      (super.noSuchMethod(
        Invocation.method(
          #getTrendingApi,
          [],
        ),
        returnValue: _i5.Future<_i2.Either<_i2.Failure, _i8.Trending>>.value(
            _FakeEither_2<_i2.Failure, _i8.Trending>(
          this,
          Invocation.method(
            #getTrendingApi,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i2.Either<_i2.Failure, _i8.Trending>>.value(
                _FakeEither_2<_i2.Failure, _i8.Trending>(
          this,
          Invocation.method(
            #getTrendingApi,
            [],
          ),
        )),
      ) as _i5.Future<_i2.Either<_i2.Failure, _i8.Trending>>);
  @override
  _i5.Future<_i2.Either<_i2.Failure, _i9.TopRated>> getTopRated() =>
      (super.noSuchMethod(
        Invocation.method(
          #getTopRated,
          [],
        ),
        returnValue: _i5.Future<_i2.Either<_i2.Failure, _i9.TopRated>>.value(
            _FakeEither_2<_i2.Failure, _i9.TopRated>(
          this,
          Invocation.method(
            #getTopRated,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i2.Either<_i2.Failure, _i9.TopRated>>.value(
                _FakeEither_2<_i2.Failure, _i9.TopRated>(
          this,
          Invocation.method(
            #getTopRated,
            [],
          ),
        )),
      ) as _i5.Future<_i2.Either<_i2.Failure, _i9.TopRated>>);
  @override
  _i5.Future<_i2.Either<_i2.Failure, _i10.MovieInTheater>>
      getMoviesInTheaters() => (super.noSuchMethod(
            Invocation.method(
              #getMoviesInTheaters,
              [],
            ),
            returnValue:
                _i5.Future<_i2.Either<_i2.Failure, _i10.MovieInTheater>>.value(
                    _FakeEither_2<_i2.Failure, _i10.MovieInTheater>(
              this,
              Invocation.method(
                #getMoviesInTheaters,
                [],
              ),
            )),
            returnValueForMissingStub:
                _i5.Future<_i2.Either<_i2.Failure, _i10.MovieInTheater>>.value(
                    _FakeEither_2<_i2.Failure, _i10.MovieInTheater>(
              this,
              Invocation.method(
                #getMoviesInTheaters,
                [],
              ),
            )),
          ) as _i5.Future<_i2.Either<_i2.Failure, _i10.MovieInTheater>>);
  @override
  _i5.Future<_i2.Either<_i2.Failure, _i11.UpcomingMovie>> getUpcomingApi() =>
      (super.noSuchMethod(
        Invocation.method(
          #getUpcomingApi,
          [],
        ),
        returnValue:
            _i5.Future<_i2.Either<_i2.Failure, _i11.UpcomingMovie>>.value(
                _FakeEither_2<_i2.Failure, _i11.UpcomingMovie>(
          this,
          Invocation.method(
            #getUpcomingApi,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i2.Either<_i2.Failure, _i11.UpcomingMovie>>.value(
                _FakeEither_2<_i2.Failure, _i11.UpcomingMovie>(
          this,
          Invocation.method(
            #getUpcomingApi,
            [],
          ),
        )),
      ) as _i5.Future<_i2.Either<_i2.Failure, _i11.UpcomingMovie>>);
}
