part of 'tes_kesehatan_kulit_bloc.dart';

abstract class TesKesehatanKulitState extends Equatable {
  const TesKesehatanKulitState();

  @override
  List<Object> get props => [];
}

class TesKesehatanKulitInitial extends TesKesehatanKulitState {}

class TesKesehatanKulitLoading extends TesKesehatanKulitState {}

class TesKesehatanKulitSuccess extends TesKesehatanKulitState {
  final ResponseTesKesehatanKulit responseTesKesehatanKulit;
  const TesKesehatanKulitSuccess(this.responseTesKesehatanKulit);
}

class TesKesehatanKulitError extends TesKesehatanKulitState {
  final ResponseTesKesehatanKulit responseErrorTesKesehatanKulit;
  const TesKesehatanKulitError(this.responseErrorTesKesehatanKulit);
}
