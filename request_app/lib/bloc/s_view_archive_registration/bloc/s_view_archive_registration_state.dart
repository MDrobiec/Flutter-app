part of 's_view_archive_registration_bloc.dart';

abstract class SViewArchiveRegistrationState extends Equatable {
  const SViewArchiveRegistrationState();

  @override
  List<Object> get props => [];
}

class SViewArchiveRegistrationInitial extends SViewArchiveRegistrationState {
  const SViewArchiveRegistrationInitial();
  @override
  List<Object> get props => [];
}

class SViewArchiveRegistrationLoading extends SViewArchiveRegistrationState {
  const SViewArchiveRegistrationLoading();
  @override
  List<Object> get props => [];
}

class SViewArchiveRegistrationLoaded extends SViewArchiveRegistrationState {
  const SViewArchiveRegistrationLoaded();

  @override
  List<Object> get props => [];
}

class SViewArchiveRegistrationError extends SViewArchiveRegistrationState {
  const SViewArchiveRegistrationError(this.message);
  final String message;
  @override
  List<Object> get props => [message];
}
