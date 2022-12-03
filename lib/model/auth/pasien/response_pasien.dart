import 'dart:convert';

ResponseGetPasien pasienFromJson(String str) =>
    ResponseGetPasien.fromJson(json.decode(str));

String pasienToJson(ResponseGetPasien data) => json.encode(data.toJson());

class ResponseGetPasien {
  Meta? meta;
  Data? data;

  ResponseGetPasien({this.meta, this.data});

  ResponseGetPasien.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? namaPasien;
  String? email;
  String? jenisKelamin;
  String? tanggalLahir;
  String? alamat;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.namaPasien,
      this.email,
      this.jenisKelamin,
      this.tanggalLahir,
      this.alamat,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
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
