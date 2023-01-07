part of '../handle_api/checkout_bloc.dart';

abstract class CheckoutEvent extends Equatable {}

class CheckoutPost extends CheckoutEvent {
  int? idDokter;
  String? diagnosaSementara;
  CheckoutPost({
    required this.idDokter,
    required this.diagnosaSementara,
  });
  @override
  List<Object?> get props => [idDokter, diagnosaSementara];
}
