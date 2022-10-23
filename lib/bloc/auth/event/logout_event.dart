part of '../handle_api/logout_bloc.dart';

abstract class LogoutEvent extends Equatable {
  const LogoutEvent();

  @override
  List<Object> get props => [];
}

class GetLogout extends LogoutEvent {}
