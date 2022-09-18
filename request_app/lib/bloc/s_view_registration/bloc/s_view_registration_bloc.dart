import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 's_view_registration_event.dart';
part 's_view_registration_state.dart';

class SViewRegistrationBloc
    extends Bloc<SViewRegistrationEvent, SViewRegistrationState> {
  SViewRegistrationBloc() : super(SViewRegistrationInitial()) {
    on<GenerateView>((event, emit) {
      // TODO: implement event handler
    });
  }
}
