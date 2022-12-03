import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter_application_myskin/service/dokter/service_dokter.dart';

import '../../../../model/auth/dokter/response_logout.dart';
import '../event/logout_event.dart';
import '../state/logout_state.dart';

class LogoutDokterBloc extends Bloc<LogoutDokterEvent, LogoutState> {
  final APIServiceDokter _apiService = APIServiceDokter();
  LogoutDokterBloc() : super(LogoutInitial()) {
    on<DokterLogout>((event, emit) async {
      emit(LogoutLoading());
      try {
        final response = await _apiService.logOutDokter();
        if (response.statusCode == 200) {
          emit(LogoutSuccess(
              ResponseLogout.fromJson(jsonDecode(response.body))));
        } else {
          emit(LogoutError(ResponseLogout()));
        }
      } catch (e) {
        emit(LogoutError(ResponseLogout()));
      }
    });
  }
}
