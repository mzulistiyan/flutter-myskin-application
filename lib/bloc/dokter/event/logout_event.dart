import 'package:equatable/equatable.dart';

abstract class LogoutDokterEvent extends Equatable {
  const LogoutDokterEvent();

  @override
  List<Object> get props => [];
}

class DokterLogout extends LogoutDokterEvent {}
