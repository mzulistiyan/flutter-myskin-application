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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = code;
    data['status'] = status;
    data['message'] = message;
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
    data['token_type'] = tokenType;
    if (dokter != null) {
      data['dokter'] = dokter!.map((v) => v.toJson()).toList();
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
  String? password;

  Dokter({
    this.idDokter,
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
  });

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
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    data['password'] = password;

    return data;
  }
}
