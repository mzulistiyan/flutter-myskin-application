part of '../handle_api/change_password_bloc.dart';

abstract class ChangePasswordEvent extends Equatable {}

class ChangePasswordPost extends ChangePasswordEvent {
  final String? oldPassword;
  final String? password;
  final String? confirmationPassword;
  ChangePasswordPost(
      {this.oldPassword, this.password, this.confirmationPassword});
  @override
  List<Object?> get props => [oldPassword, password, confirmationPassword];
}
