import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_myskin/model/auth/response_logout.dart';
import 'package:flutter_application_myskin/service/auth/service_auth.dart';

part '../event/logout_event.dart';
part '../state/logout_state.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  final APIService _apiService = APIService();
  LogoutBloc() : super(LogoutInitial()) {
    on<GetLogout>((event, emit) async {
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
