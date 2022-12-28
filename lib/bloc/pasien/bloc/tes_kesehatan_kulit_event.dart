part of 'tes_kesehatan_kulit_bloc.dart';

abstract class TesKesehatanKulitEvent extends Equatable {}

class TesKesehatanKulit extends TesKesehatanKulitEvent {
  String? diagnosaSementara;
  TesKesehatanKulit({
    required this.diagnosaSementara,
  });
  @override
  List<Object?> get props => [diagnosaSementara];
}
