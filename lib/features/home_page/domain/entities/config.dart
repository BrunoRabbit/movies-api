import 'package:equatable/equatable.dart';

class Config extends Equatable {
  final Images? images;
  final List<String>? changeKeys;

  const Config({
    required this.images,
    required this.changeKeys,
  });

  @override
  List<Object?> get props => [
        if (images != null) images,
        if (changeKeys != null) changeKeys,
      ];
}

class Images extends Equatable {
  final String? baseUrl;
  final String? secureBaseUrl;
  final List<String>? backdropSizes;
  final List<String>? logoSizes;
  final List<String>? posterSizes;
  final List<String>? profileSizes;
  final List<String>? stillSizes;

  const Images(
      {this.baseUrl,
      this.secureBaseUrl,
      this.backdropSizes,
      this.logoSizes,
      this.posterSizes,
      this.profileSizes,
      this.stillSizes});

  factory Images.fromMap(Map<String, dynamic> map) {
    return Images(
      baseUrl: map['base_url'],
      secureBaseUrl: map['secure_base_url'],
      backdropSizes: map['backdrop_sizes'].cast<String>(),
      logoSizes: map['logo_sizes'].cast<String>(),
      posterSizes: map['poster_sizes'].cast<String>(),
      profileSizes: map['profile_sizes'].cast<String>(),
      stillSizes: map['still_sizes'].cast<String>(),
    );
  }

  @override
  List<Object?> get props => [
        if (baseUrl != null) baseUrl,
        if (secureBaseUrl != null) secureBaseUrl,
        if (backdropSizes != null) backdropSizes,
        if (logoSizes != null) logoSizes,
        if (posterSizes != null) posterSizes,
        if (profileSizes != null) profileSizes,
        if (stillSizes != null) stillSizes
      ];
}
