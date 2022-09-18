part of 's_view_my_registration_bloc.dart';

abstract class SViewMyRegistrationState extends Equatable {
  const SViewMyRegistrationState();

  @override
  List<Object> get props => [];
}

class SViewMyRegistrationInitial extends SViewMyRegistrationState {
  const SViewMyRegistrationInitial();
  @override
  List<Object> get props => [];
}

class SViewMyRegistrationLoading extends SViewMyRegistrationState {
  const SViewMyRegistrationLoading();
  @override
  List<Object> get props => [];
}

class SViewMyRegistrationLoaded extends SViewMyRegistrationState {
  const SViewMyRegistrationLoaded(this.list);
  final List list;
  @override
  List<Object> get props => [];
}

class SViewMyRegistrationError extends SViewMyRegistrationState {
  const SViewMyRegistrationError(this.message);
  final String message;
  @override
  List<Object> get props => [message];
}
