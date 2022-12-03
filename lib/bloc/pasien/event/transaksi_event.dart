part of '../handle_api/transaksi_bloc.dart';

abstract class TransaksiEvent extends Equatable {
  const TransaksiEvent();

  @override
  List<Object> get props => [];
}

class GetTransaksi extends TransaksiEvent {}
