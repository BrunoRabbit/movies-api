import 'dart:convert';

import 'package:movies_api/features/home_page/domain/entities/config.dart';

class ConfigModel extends Config {
  const ConfigModel({
    required Images images,
    required List<String> changeKeys,
  }) : super(
          images: images,
          changeKeys: changeKeys,
        );

  factory ConfigModel.fromMap(Map<String, dynamic> map) {
    return ConfigModel(
      images: (map['images'] != null ? Images.fromMap(map['images']) : null)!,
      changeKeys: List<String>.from(map['change_keys']),
    );
  }
  factory ConfigModel.fromJson(String source) =>
      ConfigModel.fromMap(json.decode(source));

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (images != null) {
      result.addAll({'images': images});
    }

    if (changeKeys != null) {
      result.addAll({'change_keys': changeKeys});
    }

    return result;
  }

  String toJson() => json.encode(toMap());

  ConfigModel wrapperFromMap(Map<String, dynamic> map) =>
      ConfigModel.fromMap(map);

  ConfigModel wrapperFromJson(String source) => ConfigModel.fromJson(source);
}
