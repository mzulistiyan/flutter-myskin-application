class ResponseProfileDokter {
  Meta? meta;
  Data? data;

  ResponseProfileDokter({this.meta, this.data});

  ResponseProfileDokter.fromJson(Map<String, dynamic> json) {
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
  int? idDokter;
  String? namaDokter;
  String? tanggalLahir;
  String? email;
  String? jenisKelamin;
  String? telp;
  String? rumahSakit;
  int? noSTR;
  int? noSIP;
  int? status;
  String? nIK;
  Null? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.idDokter,
      this.namaDokter,
      this.tanggalLahir,
      this.email,
      this.jenisKelamin,
      this.telp,
      this.rumahSakit,
      this.noSTR,
      this.noSIP,
      this.status,
      this.nIK,
      this.emailVerifiedAt,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    idDokter = json['id_dokter'];
    namaDokter = json['nama_dokter'];
    tanggalLahir = json['tanggal_lahir'];
    email = json['email'];
    jenisKelamin = json['jenis_kelamin'];
    telp = json['telp'];
    rumahSakit = json['rumah_sakit'];
    noSTR = json['no_STR'];
    noSIP = json['no_SIP'];
    status = json['status'];
    nIK = json['NIK'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_dokter'] = this.idDokter;
    data['nama_dokter'] = this.namaDokter;
    data['tanggal_lahir'] = this.tanggalLahir;
    data['email'] = this.email;
    data['jenis_kelamin'] = this.jenisKelamin;
    data['telp'] = this.telp;
    data['rumah_sakit'] = this.rumahSakit;
    data['no_STR'] = this.noSTR;
    data['no_SIP'] = this.noSIP;
    data['status'] = this.status;
    data['NIK'] = this.nIK;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
