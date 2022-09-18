import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 's_view_registration_details_event.dart';
part 's_view_registration_details_state.dart';

class SViewRegistrationDetailsBloc
    extends Bloc<SViewRegistrationDetailsEvent, SViewRegistrationDetailsState> {
  SViewRegistrationDetailsBloc() : super(SViewRegistrationDetailsInitial()) {
    on<GenerateView>((event, emit) {
      // TODO: implement event handler
    });
  }
}
