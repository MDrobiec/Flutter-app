part of 's_view_logi_bloc.dart';

abstract class SViewLogiState extends Equatable {
  const SViewLogiState();

  @override
  List<Object> get props => [];
}

class SViewLogiInitial extends SViewLogiState {
  const SViewLogiInitial();
  @override
  List<Object> get props => [];
}

class SViewLogiLoading extends SViewLogiState {
  const SViewLogiLoading();
  @override
  List<Object> get props => [];
}

class SViewLogiLoaded extends SViewLogiState {
  const SViewLogiLoaded(this.list);
  final List list;
  @override
  List<Object> get props => [];
}

class SViewLogiError extends SViewLogiState {
  const SViewLogiError(this.message);
  final String message;
  @override
  List<Object> get props => [message];
}
