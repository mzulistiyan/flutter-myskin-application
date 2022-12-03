import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_myskin/model/auth/dokter/response_dokter.dart';
import 'package:flutter_application_myskin/service/dokter/service_dokter.dart';

part '../event/profile_dokter_event.dart';
part '../state/profile_dokter_state.dart';

class ProfileDokterBloc extends Bloc<ProfileDokterEvent, ProfileDokterState> {
  final APIServiceDokter _apiService = APIServiceDokter();

  ProfileDokterBloc() : super(ProfileDokterInitial()) {
    on<ProfileDokterEvent>((event, emit) async {
      emit(ProfileDokterLoading());
      try {
        final response = await _apiService.getDataDokter();
        if (response.statusCode == 200) {
          emit(ProfileDokterSuccess(
              ResponseProfileDokter.fromJson(jsonDecode(response.body))));
        } else {
          emit(
            ProfileDokterError(
              ResponseProfileDokter.fromJson(
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
