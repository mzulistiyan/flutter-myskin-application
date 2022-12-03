part of '../handle_api/update_pasien_bloc.dart';

abstract class UpdatePasienState extends Equatable {
  const UpdatePasienState();

  @override
  List<Object> get props => [];
}

class UpdatePasienInitial extends UpdatePasienState {}

class UpdatePasienLoading extends UpdatePasienState {}

class UpdatePasienSuccess extends UpdatePasienState {
  final ResponseUpdatePasien responseUpdatePasien;
  const UpdatePasienSuccess(this.responseUpdatePasien);
}

class UpdatePasienError extends UpdatePasienState {
  final ResponseUpdatePasien responseUpdatePasien;
  const UpdatePasienError(this.responseUpdatePasien);
}
