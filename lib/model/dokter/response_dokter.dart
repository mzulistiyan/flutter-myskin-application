import 'dart:convert';

ResponseDokter responseDokterFromJson(String str) =>
    ResponseDokter.fromJson(json.decode(str));

String responseDokterToJson(ResponseDokter data) => json.encode(data.toJson());

class ResponseDokter {
  Meta? meta;
  Data? data;

  ResponseDokter({this.meta, this.data});

  ResponseDokter.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Meta {
  int? code;
  String? status;
  String? message;

  Meta({this.code, this.status, this.message});

  Meta.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}

class Data {
  String? tokenType;
  List<Dokter>? dokter;

  Data({this.tokenType, this.dokter});

  Data.fromJson(Map<String, dynamic> json) {
    tokenType = json['token_type'];
    if (json['dokter'] != null) {
      dokter = <Dokter>[];
      json['dokter'].forEach((v) {
        dokter!.add(new Dokter.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token_type'] = this.tokenType;
    if (this.dokter != null) {
      data['dokter'] = this.dokter!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Dokter {
  String? id;
  String? namaDokter;
  String? tanggalLahir;
  String? email;
  String? jenisKelamin;
  String? telp;
  String? rumahSakit;
  String? noSTR;
  String? noSIP;
  String? nIK;
  String? password;
  Null? rememberToken;
  Null? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;

  Dokter(
      {this.id,
      this.namaDokter,
      this.tanggalLahir,
      this.email,
      this.jenisKelamin,
      this.telp,
      this.rumahSakit,
      this.noSTR,
      this.noSIP,
      this.nIK,
      this.password,
      this.rememberToken,
      this.emailVerifiedAt,
      this.createdAt,
      this.updatedAt});

  Dokter.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaDokter = json['nama_dokter'];
    tanggalLahir = json['tanggal_lahir'];
    email = json['email'];
    jenisKelamin = json['jenis_kelamin'];
    telp = json['telp'];
    rumahSakit = json['rumah_sakit'];
    noSTR = json['no_STR'];
    noSIP = json['no_SIP'];
    nIK = json['NIK'];
    password = json['password'];
    rememberToken = json['remember_token'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama_dokter'] = this.namaDokter;
    data['tanggal_lahir'] = this.tanggalLahir;
    data['email'] = this.email;
    data['jenis_kelamin'] = this.jenisKelamin;
    data['telp'] = this.telp;
    data['rumah_sakit'] = this.rumahSakit;
    data['no_STR'] = this.noSTR;
    data['no_SIP'] = this.noSIP;
    data['NIK'] = this.nIK;
    data['password'] = this.password;
    data['remember_token'] = this.rememberToken;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
