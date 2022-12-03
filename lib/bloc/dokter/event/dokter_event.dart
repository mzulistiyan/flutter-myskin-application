part of '../handle_api/dokter_bloc.dart';

abstract class DokterEvent extends Equatable {
  const DokterEvent();

  @override
  List<Object> get props => [];
}

class GetDokter extends DokterEvent {}
