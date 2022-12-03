part of '../handle_api/consults_dokter_bloc.dart';

abstract class ConsultsDokterEvent extends Equatable {
  const ConsultsDokterEvent();

  @override
  List<Object> get props => [];
}

class GetConsultsDokterDokter extends ConsultsDokterEvent {}
