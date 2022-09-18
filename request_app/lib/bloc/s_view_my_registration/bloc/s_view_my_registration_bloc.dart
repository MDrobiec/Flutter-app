import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 's_view_my_registration_event.dart';
part 's_view_my_registration_state.dart';

class SViewMyRegistrationBloc
    extends Bloc<SViewMyRegistrationEvent, SViewMyRegistrationState> {
  SViewMyRegistrationBloc() : super(SViewMyRegistrationInitial()) {
    on<GenerateView>((event, emit) {
      // TODO: implement event handler
    });
  }
}
