import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_myskin/model/response_konsultasi.dart';
import 'package:flutter_application_myskin/service/pasien/service_pasien.dart';

part '../event/consults_pasien_event.dart';
part '../state/consults_pasien_state.dart';

class ConsultsPasienBloc
    extends Bloc<ConsultsPasienEvent, ConsultsPasienState> {
  ConsultsPasienBloc() : super(ConsultsPasienInitial()) {
    final APIService _apiService = APIService();

    on<ConsultsPasienEvent>((event, emit) async {
      emit(ConsultsPasienLoading());
      try {
        final response = await _apiService.getConsultsPasien();
        if (response.statusCode == 200) {
          emit(ConsultsPasienSuccess(
              ResponseConsultsPasien.fromJson(jsonDecode(response.body))));
        } else {
          emit(
            ConsultsPasienError(
              ResponseConsultsPasien.fromJson(
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
