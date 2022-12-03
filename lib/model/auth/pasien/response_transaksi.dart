class ResponseTransaksi {
  Meta? meta;
  List<DataTransaksi>? data;

  ResponseTransaksi({this.meta, this.data});

  ResponseTransaksi.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    if (json['data'] != null) {
      data = <DataTransaksi>[];
      json['data'].forEach((v) {
        data!.add(DataTransaksi.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
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

class DataTransaksi {
  int? id;
  int? totalBayar;
  String? statusBayar;
  String? paymentUrl;
  String? idPasien;
  String? idDokter;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  Dokter? dokter;
  Pasien? pasien;

  DataTransaksi(
      {this.id,
      this.totalBayar,
      this.statusBayar,
      this.paymentUrl,
      this.idPasien,
      this.idDokter,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.dokter,
      this.pasien});

  DataTransaksi.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    totalBayar = json['total_bayar'];
    statusBayar = json['status_bayar'];
    paymentUrl = json['payment_url'];
    idPasien = json['id_pasien'];
    idDokter = json['id_dokter'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    dokter = json['dokter'] != null ? Dokter.fromJson(json['dokter']) : null;
    pasien = json['pasien'] != null ? Pasien.fromJson(json['pasien']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['total_bayar'] = totalBayar;
    data['status_bayar'] = statusBayar;
    data['payment_url'] = paymentUrl;
    data['id_pasien'] = idPasien;
    data['id_dokter'] = idDokter;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    if (dokter != null) {
      data['dokter'] = dokter!.toJson();
    }
    if (pasien != null) {
      data['pasien'] = pasien!.toJson();
    }
    return data;
  }
}

class Dokter {
  int? idDokter;
  String? namaDokter;
  String? tanggalLahir;
  String? email;
  String? jenisKelamin;
  String? telp;
  String? rumahSakit;
  int? noSTR;
  int? noSIP;
  String? nIK;
  Null? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;

  Dokter(
      {this.idDokter,
      this.namaDokter,
      this.tanggalLahir,
      this.email,
      this.jenisKelamin,
      this.telp,
      this.rumahSakit,
      this.noSTR,
      this.noSIP,
      this.nIK,
      this.emailVerifiedAt,
      this.createdAt,
      this.updatedAt});

  Dokter.fromJson(Map<String, dynamic> json) {
    idDokter = json['id_dokter'];
    namaDokter = json['nama_dokter'];
    tanggalLahir = json['tanggal_lahir'];
    email = json['email'];
    jenisKelamin = json['jenis_kelamin'];
    telp = json['telp'];
    rumahSakit = json['rumah_sakit'];
    noSTR = json['no_STR'];
    noSIP = json['no_SIP'];
    nIK = json['NIK'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_dokter'] = idDokter;
    data['nama_dokter'] = namaDokter;
    data['tanggal_lahir'] = tanggalLahir;
    data['email'] = email;
    data['jenis_kelamin'] = jenisKelamin;
    data['telp'] = telp;
    data['rumah_sakit'] = rumahSakit;
    data['no_STR'] = noSTR;
    data['no_SIP'] = noSIP;
    data['NIK'] = nIK;
    data['email_verified_at'] = emailVerifiedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Pasien {
  int? idPasien;
  String? namaPasien;
  String? email;
  String? jenisKelamin;
  String? tanggalLahir;
  String? alamat;

  String? createdAt;
  String? updatedAt;

  Pasien(
      {this.idPasien,
      this.namaPasien,
      this.email,
      this.jenisKelamin,
      this.tanggalLahir,
      this.alamat,
      this.createdAt,
      this.updatedAt});

  Pasien.fromJson(Map<String, dynamic> json) {
    idPasien = json['id_pasien'];
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
    data['id_pasien'] = idPasien;
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
