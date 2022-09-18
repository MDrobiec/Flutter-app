part of 's_view_user_bloc.dart';

abstract class SViewUserState extends Equatable {
  const SViewUserState();

  @override
  List<Object> get props => [];
}

class SViewUserInitial extends SViewUserState {
  const SViewUserInitial();
  @override
  List<Object> get props => [];
}

class SViewUserLoading extends SViewUserState {
  const SViewUserLoading();
  @override
  List<Object> get props => [];
}

class SViewUserLoaded extends SViewUserState {
  const SViewUserLoaded(this.list);
  final List list;
  @override
  List<Object> get props => [];
}

class SViewUserError extends SViewUserState {
  const SViewUserError(this.message);
  final String message;
  @override
  List<Object> get props => [message];
}
