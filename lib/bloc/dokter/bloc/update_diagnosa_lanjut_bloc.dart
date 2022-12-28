import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'update_diagnosa_lanjut_event.dart';
part 'update_diagnosa_lanjut_state.dart';

class UpdateDiagnosaLanjutBloc extends Bloc<UpdateDiagnosaLanjutEvent, UpdateDiagnosaLanjutState> {
  UpdateDiagnosaLanjutBloc() : super(UpdateDiagnosaLanjutInitial()) {
    on<UpdateDiagnosaLanjutEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
