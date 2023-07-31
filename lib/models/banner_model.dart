// To parse this JSON data, do
//
//     final bannerModel = bannerModelFromJson(jsonString);

import 'dart:convert';

BannerModel bannerModelFromJson(String str) =>
    BannerModel.fromJson(json.decode(str));

String bannerModelToJson(BannerModel data) => json.encode(data.toJson());

class BannerModel {
  String bannerId;
  String bannerUrl;

  BannerModel({
    required this.bannerId,
    required this.bannerUrl,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
        bannerId: json["banner_id"],
        bannerUrl: json["banner_url"],
      );

  Map<String, dynamic> toJson() => {
        "banner_id": bannerId,
        "banner_url": bannerUrl,
      };
}
