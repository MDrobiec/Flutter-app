part of 's_view_login_bloc.dart';

abstract class SViewLoginEvent extends Equatable {
  const SViewLoginEvent();

  @override
  List<Object> get props => [];
}

class GenerateView extends SViewLoginEvent {
  @override
  List<Object> get props => [];
}

class LoginPassword extends SViewLoginEvent {
  const LoginPassword(this.login, this.haslo, this.context);
  final String login;
  final String haslo;
  final BuildContext context;
  @override
  List<Object> get props => [];
}
