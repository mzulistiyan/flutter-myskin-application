import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {}

class LoginPost extends LoginEvent {
  final String? email;
  final String? password;
  LoginPost({this.email, this.password});
  @override
  List<Object?> get props => [email, password];
}
