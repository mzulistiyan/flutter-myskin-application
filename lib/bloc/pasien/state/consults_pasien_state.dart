part of '../handle_api/consults_pasien_bloc.dart';

abstract class ConsultsPasienState extends Equatable {
  const ConsultsPasienState();

  @override
  List<Object> get props => [];
}

class ConsultsPasienInitial extends ConsultsPasienState {}

class ConsultsPasienLoading extends ConsultsPasienState {}

class ConsultsPasienSuccess extends ConsultsPasienState {
  final ResponseConsultsPasien responseConsultsPasien;
  const ConsultsPasienSuccess(this.responseConsultsPasien);
}

class ConsultsPasienError extends ConsultsPasienState {
  final ResponseConsultsPasien responseErrorConsultsPasien;
  const ConsultsPasienError(this.responseErrorConsultsPasien);
}
