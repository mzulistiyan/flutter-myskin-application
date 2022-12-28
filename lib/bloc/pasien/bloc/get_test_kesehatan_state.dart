part of 'get_test_kesehatan_bloc.dart';

abstract class GetTestKesehatanState extends Equatable {
  const GetTestKesehatanState();

  @override
  List<Object> get props => [];
}

class GetTestKesehatanInitial extends GetTestKesehatanState {}

class GetTestKesehatanLoading extends GetTestKesehatanState {}

class GetTestKesehatanSuccess extends GetTestKesehatanState {
  final ResponseGetTestKesehatan responseGetTestKesehatan;
  const GetTestKesehatanSuccess(this.responseGetTestKesehatan);
}

class GetTestKesehatanError extends GetTestKesehatanState {
  final ResponseGetTestKesehatan responseErrorGetTestKesehatan;
  const GetTestKesehatanError(this.responseErrorGetTestKesehatan);
}
