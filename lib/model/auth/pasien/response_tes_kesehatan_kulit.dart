// To parse this JSON data, do
//
//     final responseGetTestKesehatan = responseGetTestKesehatanFromJson(jsonString);

import 'dart:convert';

ResponseGetTestKesehatan responseGetTestKesehatanFromJson(String str) =>
    ResponseGetTestKesehatan.fromJson(json.decode(str));

String responseGetTestKesehatanToJson(ResponseGetTestKesehatan data) =>
    json.encode(data.toJson());

class ResponseGetTestKesehatan {
  ResponseGetTestKesehatan({
    this.meta,
    this.data,
  });

  Meta? meta;
  List<Datum>? data;

  factory ResponseGetTestKesehatan.fromJson(Map<String, dynamic> json) =>
      ResponseGetTestKesehatan(
        meta: Meta.fromJson(json["meta"]),
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "meta": meta!.toJson(),
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.idPasien,
    this.diagnosaSementara,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? idPasien;
  String? diagnosaSementara;
  String? createdAt;
  DateTime? updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        idPasien: json["id_pasien"],
        diagnosaSementara: json["diagnosa_sementara"],
        createdAt: json["created_at"],
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_pasien": idPasien,
        "diagnosa_sementara": diagnosaSementara,
        "created_at": createdAt!,
        "updated_at": updatedAt!,
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
