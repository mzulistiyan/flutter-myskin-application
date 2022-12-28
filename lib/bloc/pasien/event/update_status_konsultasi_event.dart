part of '../handle_api/update_status_konsultasi_bloc.dart';

abstract class UpdateStatusKonsultasiEvent extends Equatable {}

class UpdateStatusKonsultasiPost extends UpdateStatusKonsultasiEvent {
  String? statusKonsultasi;
  int? id;

  UpdateStatusKonsultasiPost({
    this.statusKonsultasi,
    this.id,
  });
  @override
  List<Object?> get props => [
        statusKonsultasi,
        id,
      ];
}
