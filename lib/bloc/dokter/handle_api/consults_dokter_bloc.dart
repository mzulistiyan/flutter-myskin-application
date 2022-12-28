import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_myskin/model/auth/dokter/response_conults_dokter.dart';
import 'package:flutter_application_myskin/model/response_konsultasi.dart';
import 'package:flutter_application_myskin/service/dokter/service_dokter.dart';

part '../event/consults_dokter_event.dart';
part '../state/consults_dokter_state.dart';

class ConsultsDokterBloc
    extends Bloc<ConsultsDokterEvent, ConsultsDokterState> {
  final APIServiceDokter _apiService = APIServiceDokter();

  ConsultsDokterBloc() : super(ConsultsDokterInitial()) {
    on<ConsultsDokterEvent>((event, emit) async {
      emit(ConsultsDokterLoading());
      try {
        final response = await _apiService.getConsultsDokter();
        if (response.statusCode == 200) {
          emit(ConsultsDokterSuccess(
              ResponseConsultsPasien.fromJson(jsonDecode(response.body))));
        } else {
          emit(
            ConsultsDokterError(
              ResponseConsultsPasien.fromJson(
                jsonDecode(response.body),
              ),
            ),
          );
        }
      } catch (e) {
        print('error get data ConsultsDokter');
      }
    });
  }
}
