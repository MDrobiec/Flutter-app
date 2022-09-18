import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:request_app/api/custom_request.dart';
import 'package:request_app/models/m_my_user.dart';
import 'package:request_app/models/m_prawa.dart';

part 's_view_dashboard_event.dart';
part 's_view_dashboard_state.dart';

class SViewDashboardBloc
    extends Bloc<SViewDashboardEvent, SViewDashboardState> {
  SViewDashboardBloc() : super(const SViewDashboardInitial()) {
    on<GenerateView>((event, emit) async {
      try {
        List list = [];
        List listMyUser = [];

        emit(const SViewDashboardLoading());
        var uri = 'https://nodejs-db-esz.herokuapp.com/app/sPrivilagesUser';
        var uriGetUser = 'https://nodejs-db-esz.herokuapp.com/app/myUser';

        final response = await CustomRequest().customRequest('', uri, 'get');
        final responseMyUser =
            await CustomRequest().customRequest('', uriGetUser, 'get');
        if (response == '' || response == null) {
          emit(const SViewDashboardError('Brak danych do wyświetlenia'));
        } else {
          list = json
              .decode(response)
              .map((request) => MPrawa.fromJson(request))
              .toList();
          listMyUser = json
              .decode(responseMyUser)
              .map((request) => MMyUser.fromJson(request))
              .toList();
          emit(SViewDashboardLoaded(list, listMyUser));
        }
      } catch (error) {
        emit(SViewDashboardError(error.toString()));
      }
    });
    on<ZaminaHasla>((event, emit) async {
      try {
        emit(const SViewDashboardLoading());
        String passowrd = event.haslo;
        var uri = 'https://nodejs-db-esz.herokuapp.com/app/userResetPassword';
        var data = 'password=$passowrd';

        final response = await CustomRequest().customRequest(data, uri, 'post');

        if (response == '' || response == null) {
          emit(const SViewDashboardError('Brak danych do wyświetlenia'));
        } else {
          emit(const SViewDashboardLoadedZmianaHasla(
              'Hasło zostało zmienione pomyślnie'));
        }
      } catch (error) {
        emit(SViewDashboardError(error.toString()));
      }
    });
  }
}
