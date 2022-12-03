import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter_application_myskin/service/pasien/service_pasien.dart';

import '../../../model/auth/pasien/response_logout.dart';
import '../event/logout_event.dart';
import '../state/logout_state.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  final APIService _apiService = APIService();
  LogoutBloc() : super(LogoutInitial()) {
    on<GetLogoutPasien>((event, emit) async {
      emit(LogoutLoading());
      try {
        final response = await _apiService.logOut();
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
