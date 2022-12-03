import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_myskin/model/dokter/response_status_konsultasi.dart';
import 'package:flutter_application_myskin/service/dokter/service_dokter.dart';

part 'update_status_konsultasi_event.dart';
part 'update_status_konsultasi_state.dart';

class UpdateStatusKonsultasiBloc
    extends Bloc<UpdateStatusKonsultasiEvent, UpdateStatusKonsultasiState> {
  UpdateStatusKonsultasiBloc() : super(UpdateStatusKonsultasiInitial()) {
    final APIServiceDokter _apiService = APIServiceDokter();

    on<UpdateStatusKonsultasiPost>((event, emit) async {
      emit(UpdateStatusKonsultasiLoading());
      try {
        final response = await _apiService.updateStatusKonsultasi(
          event.statusKonsultasi!,
          event.id!,
        );

        if (response.statusCode == 200) {
          emit(UpdateStatusKonsultasiSuccess(
              ResponseUpdateStatusKonsultasi.fromJson(
                  jsonDecode(response.body))));
        } else {
          dynamic resBad = jsonDecode(response.body);

          emit(UpdateStatusKonsultasiError(ResponseUpdateStatusKonsultasi(
              meta: Meta(
                  code: response.statusCode, message: resBad, status: 'Bad'),
              data: resBad)));
        }
      } catch (e) {
        emit(
          UpdateStatusKonsultasiError(
            ResponseUpdateStatusKonsultasi(
                meta: Meta(code: 0, status: 'Error', message: e.toString()),
                data: null),
          ),
        );
      }
    });
  }
}
