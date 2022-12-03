class ResponseConsultsPasien {
  Meta? meta;
  List<Data>? data;

  ResponseConsultsPasien({this.meta, this.data});

  ResponseConsultsPasien.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
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

class Data {
  int? id;
  String? diagnosaSementara;
  String? diagnosaLanjut;
  String? statusKonsultasi;
  String? idTransaksi;
  String? idPasien;
  String? idDokter;
  String? createdAt;
  String? updatedAt;
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
    dokter = json['dokter'] != null ? Dokter.fromJson(json['dokter']) : null;
    pasien = json['pasien'] != null ? Pasien.fromJson(json['pasien']) : null;
    transaksi = json['transaksi'] != null
        ? Transaksi.fromJson(json['transaksi'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['diagnosa_sementara'] = diagnosaSementara;
    data['diagnosa_lanjut'] = diagnosaLanjut;
    data['status_konsultasi'] = statusKonsultasi;
    data['id_transaksi'] = idTransaksi;
    data['id_pasien'] = idPasien;
    data['id_dokter'] = idDokter;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (dokter != null) {
      data['dokter'] = dokter!.toJson();
    }
    if (pasien != null) {
      data['pasien'] = pasien!.toJson();
    }
    if (transaksi != null) {
      data['transaksi'] = transaksi!.toJson();
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

class Transaksi {
  int? id;
  int? totalBayar;
  String? statusBayar;
  String? diagnosaSementara;
  String? paymentUrl;
  String? idPasien;
  String? idDokter;
  String? createdAt;
  String? updatedAt;

  Transaksi({
    this.id,
    this.totalBayar,
    this.statusBayar,
    this.diagnosaSementara,
    this.paymentUrl,
    this.idPasien,
    this.idDokter,
    this.createdAt,
    this.updatedAt,
  });

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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['total_bayar'] = totalBayar;
    data['status_bayar'] = statusBayar;
    data['diagnosa_sementara'] = diagnosaSementara;
    data['payment_url'] = paymentUrl;
    data['id_pasien'] = idPasien;
    data['id_dokter'] = idDokter;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
