part of '../../pasien/handle_api/update_status_konsultasi_bloc.dart';

abstract class UpdateStatusKonsultasiState extends Equatable {
  const UpdateStatusKonsultasiState();

  @override
  List<Object> get props => [];
}

class UpdateStatusKonsultasiInitial extends UpdateStatusKonsultasiState {}

class UpdateStatusKonsultasiLoading extends UpdateStatusKonsultasiState {}

class UpdateStatusKonsultasiSuccess extends UpdateStatusKonsultasiState {
  final ResponseUpdateStatusKonsultasi responseUpdateStatusKonsultasi;
  const UpdateStatusKonsultasiSuccess(this.responseUpdateStatusKonsultasi);
}

class UpdateStatusKonsultasiError extends UpdateStatusKonsultasiState {
  final ResponseUpdateStatusKonsultasi responseUpdateStatusKonsultasi;
  const UpdateStatusKonsultasiError(this.responseUpdateStatusKonsultasi);
}
