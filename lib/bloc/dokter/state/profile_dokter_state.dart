part of '../handle_api/profile_dokter_bloc.dart';

abstract class ProfileDokterState extends Equatable {
  const ProfileDokterState();

  @override
  List<Object> get props => [];
}

class ProfileDokterInitial extends ProfileDokterState {}

class ProfileDokterLoading extends ProfileDokterState {}

class ProfileDokterSuccess extends ProfileDokterState {
  final ResponseProfileDokter responseDokter;
  const ProfileDokterSuccess(this.responseDokter);
}

class ProfileDokterError extends ProfileDokterState {
  final ResponseProfileDokter responseErrorProfileDokter;
  const ProfileDokterError(this.responseErrorProfileDokter);
}
