part of '../handle_api/profile_dokter_bloc.dart';

abstract class ProfileDokterEvent extends Equatable {
  const ProfileDokterEvent();

  @override
  List<Object> get props => [];
}

class GetProfileDokter extends ProfileDokterEvent {}
