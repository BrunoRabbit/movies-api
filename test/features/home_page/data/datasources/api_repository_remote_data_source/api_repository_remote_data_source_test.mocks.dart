// Mocks generated by Mockito 5.4.4 from annotations
// in movies_api/test/features/home_page/data/datasources/api_repository_remote_data_source/api_repository_remote_data_source_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i11;

import 'package:http/http.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i10;
import 'package:movies_api/features/home_page/data/datasources/api_repository_remote_data_source.dart'
    as _i9;
import 'package:movies_api/features/home_page/data/models/config_model.dart'
    as _i3;
import 'package:movies_api/features/home_page/data/models/movie_in_theater_model.dart'
    as _i7;
import 'package:movies_api/features/home_page/data/models/movie_model.dart'
    as _i4;
import 'package:movies_api/features/home_page/data/models/top_rated_model.dart'
    as _i6;
import 'package:movies_api/features/home_page/data/models/trending_model.dart'
    as _i5;
import 'package:movies_api/features/home_page/data/models/upcoming_movie_model.dart'
    as _i8;

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

class _FakeResponse_0 extends _i1.SmartFake implements _i2.Response {
  _FakeResponse_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeConfigModel_1 extends _i1.SmartFake implements _i3.ConfigModel {
  _FakeConfigModel_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeMovieModel_2 extends _i1.SmartFake implements _i4.MovieModel {
  _FakeMovieModel_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeTrendingModel_3 extends _i1.SmartFake implements _i5.TrendingModel {
  _FakeTrendingModel_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeTopRatedModel_4 extends _i1.SmartFake implements _i6.TopRatedModel {
  _FakeTopRatedModel_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeMovieInTheaterModel_5 extends _i1.SmartFake
    implements _i7.MovieInTheaterModel {
  _FakeMovieInTheaterModel_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeUpcomingMovieModel_6 extends _i1.SmartFake
    implements _i8.UpcomingMovieModel {
  _FakeUpcomingMovieModel_6(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [ApiRepositoryRemoteDataSourceImpl].
///
/// See the documentation for Mockito's code generation for more information.
class MockApiRepositoryRemoteDataSourceImpl extends _i1.Mock
    implements _i9.ApiRepositoryRemoteDataSourceImpl {
  @override
  String get key => (super.noSuchMethod(
        Invocation.getter(#key),
        returnValue: _i10.dummyValue<String>(
          this,
          Invocation.getter(#key),
        ),
        returnValueForMissingStub: _i10.dummyValue<String>(
          this,
          Invocation.getter(#key),
        ),
      ) as String);

  @override
  _i2.Response get response => (super.noSuchMethod(
        Invocation.getter(#response),
        returnValue: _FakeResponse_0(
          this,
          Invocation.getter(#response),
        ),
        returnValueForMissingStub: _FakeResponse_0(
          this,
          Invocation.getter(#response),
        ),
      ) as _i2.Response);

  @override
  set response(_i2.Response? _response) => super.noSuchMethod(
        Invocation.setter(
          #response,
          _response,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i11.Future<_i3.ConfigModel> getConfigurationApi() => (super.noSuchMethod(
        Invocation.method(
          #getConfigurationApi,
          [],
        ),
        returnValue: _i11.Future<_i3.ConfigModel>.value(_FakeConfigModel_1(
          this,
          Invocation.method(
            #getConfigurationApi,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i11.Future<_i3.ConfigModel>.value(_FakeConfigModel_1(
          this,
          Invocation.method(
            #getConfigurationApi,
            [],
          ),
        )),
      ) as _i11.Future<_i3.ConfigModel>);

  @override
  _i11.Future<_i4.MovieModel> getPopularMovies() => (super.noSuchMethod(
        Invocation.method(
          #getPopularMovies,
          [],
        ),
        returnValue: _i11.Future<_i4.MovieModel>.value(_FakeMovieModel_2(
          this,
          Invocation.method(
            #getPopularMovies,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i11.Future<_i4.MovieModel>.value(_FakeMovieModel_2(
          this,
          Invocation.method(
            #getPopularMovies,
            [],
          ),
        )),
      ) as _i11.Future<_i4.MovieModel>);

  @override
  _i11.Future<_i5.TrendingModel> getTrendingApi() => (super.noSuchMethod(
        Invocation.method(
          #getTrendingApi,
          [],
        ),
        returnValue: _i11.Future<_i5.TrendingModel>.value(_FakeTrendingModel_3(
          this,
          Invocation.method(
            #getTrendingApi,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i11.Future<_i5.TrendingModel>.value(_FakeTrendingModel_3(
          this,
          Invocation.method(
            #getTrendingApi,
            [],
          ),
        )),
      ) as _i11.Future<_i5.TrendingModel>);

  @override
  _i11.Future<_i6.TopRatedModel> getTopRatedApi() => (super.noSuchMethod(
        Invocation.method(
          #getTopRatedApi,
          [],
        ),
        returnValue: _i11.Future<_i6.TopRatedModel>.value(_FakeTopRatedModel_4(
          this,
          Invocation.method(
            #getTopRatedApi,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i11.Future<_i6.TopRatedModel>.value(_FakeTopRatedModel_4(
          this,
          Invocation.method(
            #getTopRatedApi,
            [],
          ),
        )),
      ) as _i11.Future<_i6.TopRatedModel>);

  @override
  _i11.Future<_i7.MovieInTheaterModel> getMoviesInTheaters() =>
      (super.noSuchMethod(
        Invocation.method(
          #getMoviesInTheaters,
          [],
        ),
        returnValue: _i11.Future<_i7.MovieInTheaterModel>.value(
            _FakeMovieInTheaterModel_5(
          this,
          Invocation.method(
            #getMoviesInTheaters,
            [],
          ),
        )),
        returnValueForMissingStub: _i11.Future<_i7.MovieInTheaterModel>.value(
            _FakeMovieInTheaterModel_5(
          this,
          Invocation.method(
            #getMoviesInTheaters,
            [],
          ),
        )),
      ) as _i11.Future<_i7.MovieInTheaterModel>);

  @override
  _i11.Future<_i8.UpcomingMovieModel> getUpcomingApi() => (super.noSuchMethod(
        Invocation.method(
          #getUpcomingApi,
          [],
        ),
        returnValue:
            _i11.Future<_i8.UpcomingMovieModel>.value(_FakeUpcomingMovieModel_6(
          this,
          Invocation.method(
            #getUpcomingApi,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i11.Future<_i8.UpcomingMovieModel>.value(_FakeUpcomingMovieModel_6(
          this,
          Invocation.method(
            #getUpcomingApi,
            [],
          ),
        )),
      ) as _i11.Future<_i8.UpcomingMovieModel>);
}

/// A class which mocks [ApiRepositoryRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockApiRepositoryRemoteDataSource extends _i1.Mock
    implements _i9.ApiRepositoryRemoteDataSource {
  @override
  _i11.Future<_i3.ConfigModel> getConfigurationApi() => (super.noSuchMethod(
        Invocation.method(
          #getConfigurationApi,
          [],
        ),
        returnValue: _i11.Future<_i3.ConfigModel>.value(_FakeConfigModel_1(
          this,
          Invocation.method(
            #getConfigurationApi,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i11.Future<_i3.ConfigModel>.value(_FakeConfigModel_1(
          this,
          Invocation.method(
            #getConfigurationApi,
            [],
          ),
        )),
      ) as _i11.Future<_i3.ConfigModel>);

  @override
  _i11.Future<_i4.MovieModel> getPopularMovies() => (super.noSuchMethod(
        Invocation.method(
          #getPopularMovies,
          [],
        ),
        returnValue: _i11.Future<_i4.MovieModel>.value(_FakeMovieModel_2(
          this,
          Invocation.method(
            #getPopularMovies,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i11.Future<_i4.MovieModel>.value(_FakeMovieModel_2(
          this,
          Invocation.method(
            #getPopularMovies,
            [],
          ),
        )),
      ) as _i11.Future<_i4.MovieModel>);

  @override
  _i11.Future<_i5.TrendingModel> getTrendingApi() => (super.noSuchMethod(
        Invocation.method(
          #getTrendingApi,
          [],
        ),
        returnValue: _i11.Future<_i5.TrendingModel>.value(_FakeTrendingModel_3(
          this,
          Invocation.method(
            #getTrendingApi,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i11.Future<_i5.TrendingModel>.value(_FakeTrendingModel_3(
          this,
          Invocation.method(
            #getTrendingApi,
            [],
          ),
        )),
      ) as _i11.Future<_i5.TrendingModel>);

  @override
  _i11.Future<_i6.TopRatedModel> getTopRatedApi() => (super.noSuchMethod(
        Invocation.method(
          #getTopRatedApi,
          [],
        ),
        returnValue: _i11.Future<_i6.TopRatedModel>.value(_FakeTopRatedModel_4(
          this,
          Invocation.method(
            #getTopRatedApi,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i11.Future<_i6.TopRatedModel>.value(_FakeTopRatedModel_4(
          this,
          Invocation.method(
            #getTopRatedApi,
            [],
          ),
        )),
      ) as _i11.Future<_i6.TopRatedModel>);

  @override
  _i11.Future<_i7.MovieInTheaterModel> getMoviesInTheaters() =>
      (super.noSuchMethod(
        Invocation.method(
          #getMoviesInTheaters,
          [],
        ),
        returnValue: _i11.Future<_i7.MovieInTheaterModel>.value(
            _FakeMovieInTheaterModel_5(
          this,
          Invocation.method(
            #getMoviesInTheaters,
            [],
          ),
        )),
        returnValueForMissingStub: _i11.Future<_i7.MovieInTheaterModel>.value(
            _FakeMovieInTheaterModel_5(
          this,
          Invocation.method(
            #getMoviesInTheaters,
            [],
          ),
        )),
      ) as _i11.Future<_i7.MovieInTheaterModel>);

  @override
  _i11.Future<_i8.UpcomingMovieModel> getUpcomingApi() => (super.noSuchMethod(
        Invocation.method(
          #getUpcomingApi,
          [],
        ),
        returnValue:
            _i11.Future<_i8.UpcomingMovieModel>.value(_FakeUpcomingMovieModel_6(
          this,
          Invocation.method(
            #getUpcomingApi,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i11.Future<_i8.UpcomingMovieModel>.value(_FakeUpcomingMovieModel_6(
          this,
          Invocation.method(
            #getUpcomingApi,
            [],
          ),
        )),
      ) as _i11.Future<_i8.UpcomingMovieModel>);
}
