part of 's_view_registration_bloc.dart';

abstract class SViewRegistrationState extends Equatable {
  const SViewRegistrationState();

  @override
  List<Object> get props => [];
}

class SViewRegistrationInitial extends SViewRegistrationState {
  const SViewRegistrationInitial();
  @override
  List<Object> get props => [];
}

class SViewRegistrationLoading extends SViewRegistrationState {
  const SViewRegistrationLoading();
  @override
  List<Object> get props => [];
}

class SViewRegistrationLoaded extends SViewRegistrationState {
  const SViewRegistrationLoaded(this.list);
  final List list;
  @override
  List<Object> get props => [];
}

class SViewRegistrationError extends SViewRegistrationState {
  const SViewRegistrationError(this.message);
  final String message;
  @override
  List<Object> get props => [message];
}
