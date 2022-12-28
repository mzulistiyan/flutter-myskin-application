part of '../handle_api/consults_dokter_bloc.dart';

abstract class ConsultsDokterState extends Equatable {
  const ConsultsDokterState();

  @override
  List<Object> get props => [];
}

class ConsultsDokterInitial extends ConsultsDokterState {}

class ConsultsDokterLoading extends ConsultsDokterState {}

class ConsultsDokterSuccess extends ConsultsDokterState {
  final ResponseConsultsPasien responseDokter;
  const ConsultsDokterSuccess(this.responseDokter);
}

class ConsultsDokterError extends ConsultsDokterState {
  final ResponseConsultsPasien responseErrorConsultsDokter;
  const ConsultsDokterError(this.responseErrorConsultsDokter);
}
