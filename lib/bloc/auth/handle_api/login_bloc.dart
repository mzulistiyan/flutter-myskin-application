import 'dart:convert';

import 'package:flutter_application_myskin/bloc/auth/state/login_state.dart';
import 'package:flutter_application_myskin/model/auth/response_login.dart';
import 'package:flutter_application_myskin/service/auth/service_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../event/login_event.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final APIService _apiService = APIService();
  LoginBloc() : super(Logininit()) {
    on<LoginPost>((event, emit) async {
      emit(LoginLoading());
      try {
        final response =
            await _apiService.loginProcess(event.email!, event.password!);
        if (response.statusCode == 200) {
          print('success login');
          emit(LoginSuccess(ResponseLogin.fromJson(jsonDecode(response.body))));
        } else {
          dynamic resBad = jsonDecode(response.body);
          print('bad logins');
          print('bad response: $resBad');
          emit(
            LoginError(
              ResponseLogin(
                  meta: Meta(
                      code: response.statusCode,
                      message: resBad.toString(),
                      status: 'Bad'),
                  data: null),
            ),
          );
        }
      } catch (e) {
        print('error login');
        emit(
          LoginError(
            ResponseLogin(
                meta: Meta(code: 0, message: e.toString(), status: 'Error'),
                data: null),
          ),
        );
      }
    });
  }
}
