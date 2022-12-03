import 'package:equatable/equatable.dart';

import '../../../model/auth/pasien/response_logout.dart';

abstract class LogoutState extends Equatable {
  const LogoutState();

  @override
  List<Object> get props => [];
}

class LogoutInitial extends LogoutState {}

class LogoutLoading extends LogoutState {}

class LogoutSuccess extends LogoutState {
  final ResponseLogout responseLogout;
  LogoutSuccess(this.responseLogout);
}

class LogoutError extends LogoutState {
  final ResponseLogout responseLogout;
  LogoutError(this.responseLogout);
}
