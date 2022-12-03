part of '../handle_api/transaksi_bloc.dart';

abstract class TransaksiState extends Equatable {
  const TransaksiState();

  @override
  List<Object> get props => [];
}

class TransaksiInitial extends TransaksiState {}

class TransaksiLoading extends TransaksiState {}

class TransaksiSuccess extends TransaksiState {
  final ResponseTransaksi responseTransaksi;
  const TransaksiSuccess(this.responseTransaksi);
}

class TransaksiError extends TransaksiState {
  final ResponseTransaksi responseErrorTransaksi;
  const TransaksiError(this.responseErrorTransaksi);
}
