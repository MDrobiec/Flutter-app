import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:request_app/api/custom_request.dart';
import 'package:request_app/screens/s_view_dashboard.dart';

part 's_view_login_event.dart';
part 's_view_login_state.dart';

class SViewLoginBloc extends Bloc<SViewLoginEvent, SViewLoginState> {
  SViewLoginBloc() : super(const SViewLoginInitial()) {
    on<GenerateView>((event, emit) async {
      try {
        emit(const SViewLoginLoading());

        emit(const SViewLoginLoaded());
      } catch (error) {
        emit(SViewLoginError(error.toString()));
      }
    });
    on<LoginPassword>((event, emit) async {
      try {
        var storage = const FlutterSecureStorage();
        String login = event.login;
        String haslo = event.haslo;
        emit(const SViewLoginLoading());
        var data = 'email=$login&password=$haslo';

        var uri = 'https://nodejs-db-esz.herokuapp.com/app/loginWeb';
        final response = await CustomRequest().customRequest(data, uri, 'post');
        if (response == '' || response == null) {
          emit(const SViewLoginError('Błąd logowania, podaj poprawne dane.'));
        } else {
          await storage.write(key: 'Authorization', value: response.toString());
          Navigator.pushReplacement(
            event.context,
            MaterialPageRoute(builder: (context) => const SViewDashboard()),
          );
        }
        emit(const SViewLoginLoaded());
      } catch (error) {
        emit(SViewLoginError(error.toString()));
      }
    });
  }
}
