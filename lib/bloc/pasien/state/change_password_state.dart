part of '../handle_api/change_password_bloc.dart';

abstract class ChangePasswordState extends Equatable {
  const ChangePasswordState();

  @override
  List<Object> get props => [];
}

class ChangePasswordInitial extends ChangePasswordState {}

class ChangePasswordLoading extends ChangePasswordState {}

class ChangePasswordSuccess extends ChangePasswordState {
  final ResponseChangePassword responseChangePassword;
  const ChangePasswordSuccess(this.responseChangePassword);
}

class ChangePasswordError extends ChangePasswordState {
  final ResponseError responseChangePassword;
  const ChangePasswordError(this.responseChangePassword);
}
