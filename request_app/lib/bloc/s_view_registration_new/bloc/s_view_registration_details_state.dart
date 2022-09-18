part of 's_view_registration_details_bloc.dart';

abstract class SViewRegistrationDetailsState extends Equatable {
  const SViewRegistrationDetailsState();

  @override
  List<Object> get props => [];
}

class SViewRegistrationDetailsInitial extends SViewRegistrationDetailsState {
  const SViewRegistrationDetailsInitial();
  @override
  List<Object> get props => [];
}

class SViewRegistrationDetailsLoading extends SViewRegistrationDetailsState {
  const SViewRegistrationDetailsLoading();
  @override
  List<Object> get props => [];
}

class SViewRegistrationDetailsLoaded extends SViewRegistrationDetailsState {
  const SViewRegistrationDetailsLoaded(this.list);
  final List list;
  @override
  List<Object> get props => [];
}

class SViewRegistrationDetailsError extends SViewRegistrationDetailsState {
  const SViewRegistrationDetailsError(this.message);
  final String message;
  @override
  List<Object> get props => [message];
}
