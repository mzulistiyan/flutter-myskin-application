part of '../handle_api/consults_pasien_bloc.dart';

abstract class ConsultsPasienEvent extends Equatable {
  const ConsultsPasienEvent();

  @override
  List<Object> get props => [];
}

class GetConsultsPasien extends ConsultsPasienEvent {}
