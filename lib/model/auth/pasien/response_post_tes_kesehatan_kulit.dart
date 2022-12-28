// To parse this JSON data, do
//
//     final responseTesKesehatanKulit = responseTesKesehatanKulitFromJson(jsonString);

import 'dart:convert';

ResponseTesKesehatanKulit responseTesKesehatanKulitFromJson(String str) =>
    ResponseTesKesehatanKulit.fromJson(json.decode(str));

String responseTesKesehatanKulitToJson(ResponseTesKesehatanKulit data) =>
    json.encode(data.toJson());

class ResponseTesKesehatanKulit {
  ResponseTesKesehatanKulit({
    this.meta,
    this.data,
  });

  Meta? meta;
  List<dynamic>? data;

  factory ResponseTesKesehatanKulit.fromJson(Map<String, dynamic> json) =>
      ResponseTesKesehatanKulit(
        meta: Meta.fromJson(json["meta"]),
        data: List<dynamic>.from(json["data"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "meta": meta!.toJson(),
        "data": List<dynamic>.from(data!.map((x) => x)),
      };
}

class Meta {
  Meta({
    this.code,
    this.status,
    this.message,
  });

  int? code;
  String? status;
  String? message;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        code: json["code"],
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
      };
}
