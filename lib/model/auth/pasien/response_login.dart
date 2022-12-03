import 'dart:convert';

ResponseLogin responseLoginFromJson(String str) =>
    ResponseLogin.fromJson(json.decode(str));

String responseLoginToJson(ResponseLogin DataLogin) =>
    json.encode(DataLogin.toJson());

class ResponseLogin {
  Meta? meta;
  Data? data;

  ResponseLogin({this.meta, this.data});

  ResponseLogin.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (meta != null) {
      data['meta'] = meta!.toJson();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}

class Data {
  String? accessToken;
  String? tokenType;
  Pasien? pasien;

  Data({this.accessToken, this.tokenType, this.pasien});

  Data.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    pasien = json['pasien'] != null ? Pasien.fromJson(json['pasien']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['access_token'] = accessToken;
    data['token_type'] = tokenType;
    if (pasien != null) {
      data['pasien'] = pasien!.toJson();
    }
    return data;
  }
}

class Pasien {
  int? id;
  String? namaPasien;
  String? email;
  String? jenisKelamin;
  String? tanggalLahir;
  String? alamat;
  String? createdAt;
  String? updatedAt;

  Pasien(
      {this.id,
      this.namaPasien,
      this.email,
      this.jenisKelamin,
      this.tanggalLahir,
      this.alamat,
      this.createdAt,
      this.updatedAt});

  Pasien.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaPasien = json['nama_pasien'];
    email = json['email'];
    jenisKelamin = json['jenis_kelamin'];
    tanggalLahir = json['tanggal_lahir'];
    alamat = json['alamat'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nama_pasien'] = namaPasien;
    data['email'] = email;
    data['jenis_kelamin'] = jenisKelamin;
    data['tanggal_lahir'] = tanggalLahir;
    data['alamat'] = alamat;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
