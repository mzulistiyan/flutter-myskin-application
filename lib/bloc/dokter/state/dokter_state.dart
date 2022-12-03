part of '../handle_api/dokter_bloc.dart';

abstract class DokterState extends Equatable {
  const DokterState();

  @override
  List<Object> get props => [];
}

class DokterInitial extends DokterState {}

class DokterLoading extends DokterState {}

class DokterSuccess extends DokterState {
  final ResponseDokter responseGetDokter;
  const DokterSuccess(this.responseGetDokter);
}

class DokterError extends DokterState {
  final ResponseDokter responseErrorDokter;
  const DokterError(this.responseErrorDokter);
}
