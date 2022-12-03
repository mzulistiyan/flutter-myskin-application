import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_myskin/model/auth/pasien/response_transaksi.dart';
import 'package:flutter_application_myskin/service/pasien/service_pasien.dart';

part '../event/transaksi_event.dart';
part '../state/transaksi_state.dart';

class TransaksiBloc extends Bloc<TransaksiEvent, TransaksiState> {
  final APIService _apiService = APIService();

  TransaksiBloc() : super(TransaksiInitial()) {
    on<TransaksiEvent>((event, emit) async {
      emit(TransaksiLoading());
      try {
        final response = await _apiService.getTransaction();
        if (response.statusCode == 200) {
          emit(TransaksiSuccess(
              ResponseTransaksi.fromJson(jsonDecode(response.body))));
        } else {
          emit(
            TransaksiError(
              ResponseTransaksi.fromJson(
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
