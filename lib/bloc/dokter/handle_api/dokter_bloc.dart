import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_myskin/model/dokter/response_dokter.dart';
import 'package:flutter_application_myskin/service/dokter/service_dokter.dart';

part '../event/dokter_event.dart';
part '../state/dokter_state.dart';

class DokterBloc extends Bloc<DokterEvent, DokterState> {
  final _apiService = APIServiceDokter();

  DokterBloc() : super(DokterInitial()) {
    on<DokterEvent>((event, emit) async {
      emit(DokterLoading());
      try {
        final response = await _apiService.getAllDokter();
        if (response.statusCode == 200) {
          emit(DokterSuccess(
              ResponseDokter.fromJson(jsonDecode(response.body))));
        } else {
          emit(
            DokterError(
              ResponseDokter.fromJson(
                jsonDecode(response.body),
              ),
            ),
          );
        }
      } catch (e) {
        print('error get data dokter');
      }
    });
  }
}
