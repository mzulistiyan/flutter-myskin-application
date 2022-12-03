import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_myskin/model/auth/pasien/response_change_password.dart';
import 'package:flutter_application_myskin/model/auth/pasien/response_error.dart';
import 'package:flutter_application_myskin/service/pasien/service_pasien.dart';

part '../event/change_password_event.dart';
part '../state/change_password_state.dart';

class ChangePasswordBloc
    extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  final APIService _apiService = APIService();

  ChangePasswordBloc() : super(ChangePasswordInitial()) {
    on<ChangePasswordPost>((event, emit) async {
      emit(ChangePasswordLoading());
      try {
        final response = await _apiService.changePassword(
            event.oldPassword!, event.password!, event.confirmationPassword!);
        if (response.statusCode == 200) {
          print('success ChangePassword');
          emit(ChangePasswordSuccess(
              ResponseChangePassword.fromJson(jsonDecode(response.body))));
        } else {
          emit(ChangePasswordError(
              ResponseError.fromJson(jsonDecode(response.body))));
        }
      } catch (e) {
        print('error ChangePassword');
      }
    });
  }
}
