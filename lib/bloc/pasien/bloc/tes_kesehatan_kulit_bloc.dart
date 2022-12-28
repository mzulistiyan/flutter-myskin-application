import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_myskin/model/auth/pasien/response_post_tes_kesehatan_kulit.dart';
import 'package:flutter_application_myskin/service/pasien/service_pasien.dart';

part 'tes_kesehatan_kulit_event.dart';
part 'tes_kesehatan_kulit_state.dart';

class TesKesehatanKulitBloc
    extends Bloc<TesKesehatanKulitEvent, TesKesehatanKulitState> {
  final APIService _apiService = APIService();

  TesKesehatanKulitBloc() : super(TesKesehatanKulitInitial()) {
    on<TesKesehatanKulit>((event, emit) async {
      emit(TesKesehatanKulitLoading());
      try {
        final response =
            await _apiService.tesKesehatanKulit(event.diagnosaSementara!);
        if (response.statusCode == 200) {
          print('success TesKesehatanKulit');
          emit(TesKesehatanKulitSuccess(
              ResponseTesKesehatanKulit.fromJson(jsonDecode(response.body))));
        } else {
          dynamic resBad = jsonDecode(response.body);

          emit(
            TesKesehatanKulitError(
              ResponseTesKesehatanKulit(
                  meta: Meta(
                      code: response.statusCode,
                      message: resBad.toString(),
                      status: 'Bad'),
                  data: null),
            ),
          );
        }
      } catch (e) {
        print('error TesKesehatanKulit');
        emit(
          TesKesehatanKulitError(
            ResponseTesKesehatanKulit(
                meta: Meta(code: 0, message: e.toString(), status: 'Error'),
                data: null),
          ),
        );
      }
    });
  }
}
