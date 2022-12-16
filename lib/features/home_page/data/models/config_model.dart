import 'package:movies_api/features/home_page/domain/entities/config.dart';

class ConfigModel extends Config {
  const ConfigModel({
    required Images images,
    required List<String> changeKeys,
  }) : super(
          images: images,
          changeKeys: changeKeys,
        );

  factory ConfigModel.fromJson(Map<String, dynamic> json) {
    return ConfigModel(
      images:
          (json['images'] != null ? Images.fromJson(json['images']) : null)!,
      changeKeys: json['change_keys'].cast<String>(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (images != null) {
      data['images'] = images!.toJson();
    }
    if (changeKeys != null) {
      data['change_keys'] = changeKeys;
    }
    return data;
  }
}
