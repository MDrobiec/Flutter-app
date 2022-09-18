import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 's_view_archive_registration_event.dart';
part 's_view_archive_registration_state.dart';

class SViewArchiveRegistrationBloc extends Bloc<SViewArchiveRegistrationEvent, SViewArchiveRegistrationState> {
  SViewArchiveRegistrationBloc() : super(SViewArchiveRegistrationInitial()) {
    on<SViewArchiveRegistrationEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
