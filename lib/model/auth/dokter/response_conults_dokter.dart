class ResponseConsultsDokter {
  Meta? meta;
  List<Data>? data;

  ResponseConsultsDokter({this.meta, this.data});

  ResponseConsultsDokter.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}

class Data {
  int? id;
  Null? diagnosaSementara;
  Null? diagnosaLanjut;
  String? statusKonsultasi;
  String? idTransaksi;
  String? idPasien;
  String? idDokter;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  Dokter? dokter;
  Pasien? pasien;
  Transaksi? transaksi;

  Data(
      {this.id,
      this.diagnosaSementara,
      this.diagnosaLanjut,
      this.statusKonsultasi,
      this.idTransaksi,
      this.idPasien,
      this.idDokter,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.dokter,
      this.pasien,
      this.transaksi});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    diagnosaSementara = json['diagnosa_sementara'];
    diagnosaLanjut = json['diagnosa_lanjut'];
    statusKonsultasi = json['status_konsultasi'];
    idTransaksi = json['id_transaksi'];
    idPasien = json['id_pasien'];
    idDokter = json['id_dokter'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    dokter =
        json['dokter'] != null ? new Dokter.fromJson(json['dokter']) : null;
    pasien =
        json['pasien'] != null ? new Pasien.fromJson(json['pasien']) : null;
    transaksi = json['transaksi'] != null
        ? new Transaksi.fromJson(json['transaksi'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['diagnosa_sementara'] = this.diagnosaSementara;
    data['diagnosa_lanjut'] = this.diagnosaLanjut;
    data['status_konsultasi'] = this.statusKonsultasi;
    data['id_transaksi'] = this.idTransaksi;
    data['id_pasien'] = this.idPasien;
    data['id_dokter'] = this.idDokter;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    if (this.dokter != null) {
      data['dokter'] = this.dokter!.toJson();
    }
    if (this.pasien != null) {
      data['pasien'] = this.pasien!.toJson();
    }
    if (this.transaksi != null) {
      data['transaksi'] = this.transaksi!.toJson();
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
  int? status;
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
      this.status,
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

class Pasien {
  int? idPasien;
  String? namaPasien;
  String? email;
  String? jenisKelamin;
  String? tanggalLahir;
  String? alamat;
  Null? emailVerifiedAt;
  Null? twoFactorSecret;
  Null? twoFactorRecoveryCodes;
  Null? twoFactorConfirmedAt;
  String? createdAt;
  String? updatedAt;

  Pasien(
      {this.idPasien,
      this.namaPasien,
      this.email,
      this.jenisKelamin,
      this.tanggalLahir,
      this.alamat,
      this.emailVerifiedAt,
      this.twoFactorSecret,
      this.twoFactorRecoveryCodes,
      this.twoFactorConfirmedAt,
      this.createdAt,
      this.updatedAt});

  Pasien.fromJson(Map<String, dynamic> json) {
    idPasien = json['id_pasien'];
    namaPasien = json['nama_pasien'];
    email = json['email'];
    jenisKelamin = json['jenis_kelamin'];
    tanggalLahir = json['tanggal_lahir'];
    alamat = json['alamat'];
    emailVerifiedAt = json['email_verified_at'];
    twoFactorSecret = json['two_factor_secret'];
    twoFactorRecoveryCodes = json['two_factor_recovery_codes'];
    twoFactorConfirmedAt = json['two_factor_confirmed_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_pasien'] = this.idPasien;
    data['nama_pasien'] = this.namaPasien;
    data['email'] = this.email;
    data['jenis_kelamin'] = this.jenisKelamin;
    data['tanggal_lahir'] = this.tanggalLahir;
    data['alamat'] = this.alamat;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['two_factor_secret'] = this.twoFactorSecret;
    data['two_factor_recovery_codes'] = this.twoFactorRecoveryCodes;
    data['two_factor_confirmed_at'] = this.twoFactorConfirmedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Transaksi {
  int? id;
  int? totalBayar;
  String? statusBayar;
  Null? diagnosaSementara;
  String? paymentUrl;
  String? idPasien;
  String? idDokter;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  Transaksi(
      {this.id,
      this.totalBayar,
      this.statusBayar,
      this.diagnosaSementara,
      this.paymentUrl,
      this.idPasien,
      this.idDokter,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Transaksi.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    totalBayar = json['total_bayar'];
    statusBayar = json['status_bayar'];
    diagnosaSementara = json['diagnosa_sementara'];
    paymentUrl = json['payment_url'];
    idPasien = json['id_pasien'];
    idDokter = json['id_dokter'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['total_bayar'] = this.totalBayar;
    data['status_bayar'] = this.statusBayar;
    data['diagnosa_sementara'] = this.diagnosaSementara;
    data['payment_url'] = this.paymentUrl;
    data['id_pasien'] = this.idPasien;
    data['id_dokter'] = this.idDokter;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
