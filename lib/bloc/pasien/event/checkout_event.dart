part of '../handle_api/checkout_bloc.dart';

abstract class CheckoutEvent extends Equatable {}

class CheckoutPost extends CheckoutEvent {
  int? idDokter;
  CheckoutPost({
    this.idDokter,
  });
  @override
  List<Object?> get props => [
        idDokter,
      ];
}
