part of '../handle_api/update_pasien_bloc.dart';

abstract class UpdatePasienEvent extends Equatable {}

class UpdatePasienPost extends UpdatePasienEvent {
  String? namaPasien;
  String? jenisKelamin;
  String? tanggalLahir;
  String? alamat;
  UpdatePasienPost({
    this.namaPasien,
    this.jenisKelamin,
    this.alamat,
    this.tanggalLahir,
  });
  @override
  List<Object?> get props => [
        namaPasien,
        jenisKelamin,
        alamat,
        tanggalLahir,
      ];
}
