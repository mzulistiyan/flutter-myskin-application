part of '../handle_api/checkout_bloc.dart';

abstract class CheckoutState extends Equatable {
  const CheckoutState();

  @override
  List<Object> get props => [];
}

class CheckoutInitial extends CheckoutState {}

class CheckoutLoading extends CheckoutState {}

class CheckoutSuccess extends CheckoutState {
  final ResponseCheckout responseCheckout;
  const CheckoutSuccess(this.responseCheckout);
}

class CheckoutError extends CheckoutState {
  final ResponseCheckout responseErrorCheckout;
  const CheckoutError(this.responseErrorCheckout);
}
