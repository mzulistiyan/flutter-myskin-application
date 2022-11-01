part of '../handle_api/pasien_bloc.dart';

abstract class PasienEvent extends Equatable {
  const PasienEvent();

  @override
  List<Object> get props => [];
}

class GetPasien extends PasienEvent {}
