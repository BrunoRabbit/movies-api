import 'dart:convert';

import 'package:movies_api/data/models/images.dart';

class Config {
  Images? images;
  List<String>? changeKeys;

  Config({
    this.images,
    required this.changeKeys,
  });

  Config.fromJson(Map<String, dynamic> json) {
    images = json['images'] != null ? Images.fromJson(json['images']) : null;
    changeKeys = json['change_keys'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (images != null) {
      data['images'] = images!.toJson();
    }
    data['change_keys'] = changeKeys;
    return data;
  }
}
