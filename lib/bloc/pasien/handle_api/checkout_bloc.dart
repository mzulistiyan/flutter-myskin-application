import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_myskin/model/auth/pasien/reseponse_checkout.dart';
import 'package:flutter_application_myskin/service/pasien/service_pasien.dart';

part '../event/checkout_event.dart';
part '../state/checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final APIService _apiService = APIService();

  CheckoutBloc() : super(CheckoutInitial()) {
    on<CheckoutPost>((event, emit) async {
      emit(CheckoutLoading());
      try {
        final response = await _apiService.checkout(
          event.idDokter!,
          event.diagnosaSementara!,
        );

        if (response.statusCode == 200) {
          emit(CheckoutSuccess(
              ResponseCheckout.fromJson(jsonDecode(response.body))));
        } else if (response.statusCode == 400) {
          ResponseCheckout e =
              ResponseCheckout.fromJson(jsonDecode(response.body));

          emit(CheckoutError(ResponseCheckout()));
        }
      } catch (e) {
        print('error Checkout');
      }
    });
  }
}
