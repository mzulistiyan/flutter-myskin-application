part of '../handle_api/pasien_bloc.dart';

abstract class PasienState extends Equatable {
  const PasienState();

  @override
  List<Object> get props => [];
}

class PasienInitial extends PasienState {}

class PasienLoading extends PasienState {}

class PasienSuccess extends PasienState {
  final ResponseGetPasien responseGetPasien;
  const PasienSuccess(this.responseGetPasien);
}

class PasienError extends PasienState {
  final ResponseGetPasien responseErrorPasien;
  const PasienError(this.responseErrorPasien);
}
