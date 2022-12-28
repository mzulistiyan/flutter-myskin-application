import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_myskin/model/auth/pasien/response_tes_kesehatan_kulit.dart';
import 'package:flutter_application_myskin/service/pasien/service_pasien.dart';

part 'get_test_kesehatan_event.dart';
part 'get_test_kesehatan_state.dart';

class GetTestKesehatanBloc
    extends Bloc<GetTestKesehatanEvent, GetTestKesehatanState> {
  final APIService _apiService = APIService();

  GetTestKesehatanBloc() : super(GetTestKesehatanInitial()) {
    on<GetTestKesehatanEvent>((event, emit) async {
      emit(GetTestKesehatanLoading());
      try {
        final response = await _apiService.getTestKesehatan();
        if (response.statusCode == 200) {
          emit(
            GetTestKesehatanSuccess(
              ResponseGetTestKesehatan.fromJson(
                jsonDecode(response.body),
              ),
            ),
          );
        } else {
          emit(
            GetTestKesehatanError(
              ResponseGetTestKesehatan.fromJson(
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
