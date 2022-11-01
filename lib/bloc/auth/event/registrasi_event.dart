part of '../handle_api/registrasi_bloc.dart';

abstract class RegistrasiEvent extends Equatable {}

class RegisterPost extends RegistrasiEvent {
  final String? email;
  final String? name;
  final String? password;
  final String? gender;
  final String? alamat;

  final String? tanggalLahir;
  final String? passwordConfirmation;
  RegisterPost({
    this.email,
    this.name,
    this.password,
    this.gender,
    this.alamat,
    this.passwordConfirmation,
    this.tanggalLahir,
  });
  @override
  List<Object?> get props => [
        email,
        password,
        name,
        gender,
        alamat,
        tanggalLahir,
        passwordConfirmation,
      ];
}
