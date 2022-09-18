import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 's_view_logi_event.dart';
part 's_view_logi_state.dart';

class SViewLogiBloc extends Bloc<SViewLogiEvent, SViewLogiState> {
  SViewLogiBloc() : super(SViewLogiInitial()) {
    on<GenerateView>((event, emit) {
      // TODO: implement event handler
    });
  }
}
