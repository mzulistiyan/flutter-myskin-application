import 'dart:convert';

import 'package:flutter_application_myskin/bloc/dokter/state/login_dokter_state.dart';
import 'package:flutter_application_myskin/model/auth/dokter/response_login_dokter.dart';
import 'package:flutter_application_myskin/service/dokter/service_dokter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../event/login_dokter_event.dart';

class LoginDokterBloc extends Bloc<LoginDokterEvent, LoginDokterState> {
  final _apiService = APIServiceDokter();
  LoginDokterBloc() : super(LoginDokterinit()) {
    on<LoginPost>((event, emit) async {
      emit(LoginDokterLoading());
      try {
        final response =
            await _apiService.loginDokter(event.email!, event.password!);
        if (response.statusCode == 200) {
          print('success login');
          emit(LoginDokterSuccess(
              ResponseLoginDokter.fromJson(jsonDecode(response.body))));
        } else {
          dynamic resBad = jsonDecode(response.body);
          print('bad logins');
          print('bad response: $resBad');
          emit(
            LoginDokterError(
              ResponseLoginDokter(
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
          LoginDokterError(
            ResponseLoginDokter(
                meta: Meta(code: 0, message: e.toString(), status: 'Error'),
                data: null),
          ),
        );
      }
    });
  }
}
