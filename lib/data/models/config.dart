import 'dart:convert';

import 'package:movies_api/data/models/images.dart';

class Config {
  Images? images;
  List<String>? changeKeys;

  Config({
    required this.images,
    required this.changeKeys,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (images != null) {
      result.addAll({'images': images!.toMap()});
    }
    if (changeKeys != null) {
      result.addAll({'changeKeys': changeKeys});
    }

    return result;
  }

  factory Config.fromMap(Map<String, dynamic> map) {
    return Config(
      images: map['images'] != null ? Images.fromMap(map['images']) : null,
      changeKeys: List<String>.from(map['changeKeys']),
    );
  }

  String toJson() => json.encode(toMap());
  factory Config.fromJson(String source) => Config.fromMap(json.decode(source));
}
