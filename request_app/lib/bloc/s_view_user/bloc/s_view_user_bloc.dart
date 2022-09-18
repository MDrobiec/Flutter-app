import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 's_view_user_event.dart';
part 's_view_user_state.dart';

class SViewUserBloc extends Bloc<SViewUserEvent, SViewUserState> {
  SViewUserBloc() : super(SViewUserInitial()) {
    on<GenerateView>((event, emit) {
      // TODO: implement event handler
    });
  }
}
