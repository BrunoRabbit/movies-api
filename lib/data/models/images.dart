import 'dart:convert';

class Images {
  String? baseUrl;
  String? secureBaseUrl;
  List<String>? backdropSizes;
  List<String>? logoSizes;
  List<String>? posterSizes;
  List<String>? profileSizes;
  List<String>? stillSizes;

  Images(
      {this.baseUrl,
      this.secureBaseUrl,
      this.backdropSizes,
      this.logoSizes,
      this.posterSizes,
      this.profileSizes,
      this.stillSizes});

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (baseUrl != null) {
      result.addAll({'baseUrl': baseUrl});
    }
    if (secureBaseUrl != null) {
      result.addAll({'secureBaseUrl': secureBaseUrl});
    }
    if (backdropSizes != null) {
      result.addAll({'backdropSizes': backdropSizes});
    }
    if (logoSizes != null) {
      result.addAll({'logoSizes': logoSizes});
    }
    if (posterSizes != null) {
      result.addAll({'posterSizes': posterSizes});
    }
    if (profileSizes != null) {
      result.addAll({'profileSizes': profileSizes});
    }
    if (stillSizes != null) {
      result.addAll({'stillSizes': stillSizes});
    }

    return result;
  }

  factory Images.fromMap(Map<String, dynamic> map) {
    return Images(
      baseUrl: map['baseUrl'],
      secureBaseUrl: map['secureBaseUrl'],
      backdropSizes: List<String>.from(map['backdropSizes']),
      logoSizes: List<String>.from(map['logoSizes']),
      posterSizes: List<String>.from(map['posterSizes']),
      profileSizes: List<String>.from(map['profileSizes']),
      stillSizes: List<String>.from(map['stillSizes']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Images.fromJson(String source) => Images.fromMap(json.decode(source));
}
