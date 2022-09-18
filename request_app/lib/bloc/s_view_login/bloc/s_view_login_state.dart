part of 's_view_login_bloc.dart';

abstract class SViewLoginState extends Equatable {
  const SViewLoginState();

  @override
  List<Object> get props => [];
}

class SViewLoginInitial extends SViewLoginState {
  const SViewLoginInitial();
  @override
  List<Object> get props => [];
}

class SViewLoginLoading extends SViewLoginState {
  const SViewLoginLoading();
  @override
  List<Object> get props => [];
}

class SViewLoginLoaded extends SViewLoginState {
  const SViewLoginLoaded();

  @override
  List<Object> get props => [];
}

class SViewLoginError extends SViewLoginState {
  const SViewLoginError(this.message);
  final String message;
  @override
  List<Object> get props => [message];
}
