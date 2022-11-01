import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_myskin/model/auth/response_pasien.dart';
import 'package:flutter_application_myskin/service/auth/service_auth.dart';

part '../event/pasien_event.dart';
part '../state/pasien_state.dart';

class PasienBloc extends Bloc<PasienEvent, PasienState> {
  final APIService _apiService = APIService();
  PasienBloc() : super(PasienInitial()) {
    on<PasienEvent>((event, emit) async {
      emit(PasienLoading());
      try {
        final response = await _apiService.getDataPasien();
        if (response.statusCode == 200) {
          emit(PasienSuccess(
              ResponseGetPasien.fromJson(jsonDecode(response.body))));
        } else {
          emit(
            PasienError(
              ResponseGetPasien.fromJson(
                jsonDecode(response.body),
              ),
            ),
          );
        }
      } catch (e) {
        print('error get data');
      }
    });
  }
}
