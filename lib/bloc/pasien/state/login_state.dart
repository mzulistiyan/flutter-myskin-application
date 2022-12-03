import 'package:equatable/equatable.dart';
import 'package:flutter_application_myskin/model/auth/pasien/response_login.dart';

abstract class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class Logininit extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final ResponseLogin responseLogin;
  LoginSuccess(this.responseLogin);
}

class LoginError extends LoginState {
  final ResponseLogin responseLogin;
  LoginError(this.responseLogin);
}
