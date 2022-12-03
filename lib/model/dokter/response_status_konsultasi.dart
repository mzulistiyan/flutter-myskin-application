class ResponseUpdateStatusKonsultasi {
  Meta? meta;
  Data? data;

  ResponseUpdateStatusKonsultasi({this.meta, this.data});

  ResponseUpdateStatusKonsultasi.fromJson(Map<String, dynamic> json) {
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
  String? diagnosaSementara;
  String? diagnosaLanjut;
  String? statusKonsultasi;
  String? idTransaksi;
  String? idPasien;
  String? idDokter;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

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
      this.deletedAt});

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
    data['deleted_at'] = deletedAt;
    return data;
  }
}
