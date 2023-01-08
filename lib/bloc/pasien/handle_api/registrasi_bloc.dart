import 'dart:convert';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_myskin/model/auth/pasien/response_registrasi.dart';

import 'package:flutter_application_myskin/service/pasien/service_pasien.dart';

part '../event/registrasi_event.dart';
part '../state/registrasi_state.dart';

class RegistrasiBloc extends Bloc<RegistrasiEvent, RegistrasiState> {
  final APIService _apiService = APIService();
  RegistrasiBloc() : super(RegistrasiInitial()) {
    on<RegisterPost>((event, emit) async {
      emit(RegistrasiLoading());
      try {
        final response = await _apiService.registrasiPasien(
          event.email!,
          event.password!,
          event.gender!,
          event.alamat!,
          event.tanggalLahir!,
          event.passwordConfirmation!,
          event.name!,
        );

        if (response.statusCode == 200) {
          emit(RegistrasiSuccess(
              ResponseRegistrasi.fromJson(jsonDecode(response.body))));
        } else if (response.statusCode == 400) {
          ResponseRegistrasi e =
              ResponseRegistrasi.fromJson(jsonDecode(response.body));

          emit(RegistrasiError(ResponseRegistrasi()));
        }
      } catch (e) {
        print('error Registrasi');
      }
    });
  }
}
