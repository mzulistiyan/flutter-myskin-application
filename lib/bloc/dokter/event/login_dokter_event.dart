import 'package:equatable/equatable.dart';

abstract class LoginDokterEvent extends Equatable {}

class LoginPost extends LoginDokterEvent {
  final String? email;
  final String? password;
  LoginPost({this.email, this.password});
  @override
  List<Object?> get props => [email, password];
}
