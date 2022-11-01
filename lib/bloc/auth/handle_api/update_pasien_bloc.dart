import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_myskin/model/auth/response_update_pasien.dart';
import 'package:flutter_application_myskin/service/auth/service_auth.dart';

part '../event/update_pasien_event.dart';
part '../state/update_pasien_state.dart';

class UpdatePasienBloc extends Bloc<UpdatePasienEvent, UpdatePasienState> {
  final APIService _apiService = APIService();

  UpdatePasienBloc() : super(UpdatePasienInitial()) {
    on<UpdatePasienPost>((event, emit) async {
      emit(UpdatePasienLoading());
      try {
        final response = await _apiService.updatePasien(
          event.namaPasien!,
          event.jenisKelamin!,
          event.tanggalLahir!,
          event.alamat!,
        );

        if (response.statusCode == 200) {
          emit(UpdatePasienSuccess(
              ResponseUpdatePasien.fromJson(jsonDecode(response.body))));
        } else {
          dynamic resBad = jsonDecode(response.body);

          emit(UpdatePasienError(ResponseUpdatePasien(
              meta: Meta(
                  code: response.statusCode, message: resBad, status: 'Bad'),
              data: resBad)));
        }
      } catch (e) {
        emit(
          UpdatePasienError(
            ResponseUpdatePasien(
                meta: Meta(code: 0, status: 'Error', message: e.toString()),
                data: null),
          ),
        );
      }
    });
  }
}
