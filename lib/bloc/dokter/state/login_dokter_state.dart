import 'package:equatable/equatable.dart';
import 'package:flutter_application_myskin/model/auth/dokter/response_login_dokter.dart';

abstract class LoginDokterState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginDokterinit extends LoginDokterState {}

class LoginDokterLoading extends LoginDokterState {}

class LoginDokterSuccess extends LoginDokterState {
  final ResponseLoginDokter responseDokterLogin;
  LoginDokterSuccess(this.responseDokterLogin);
}

class LoginDokterError extends LoginDokterState {
  final ResponseLoginDokter responseDokterLogin;
  LoginDokterError(this.responseDokterLogin);
}
