part of 's_view_dashboard_bloc.dart';

abstract class SViewDashboardEvent extends Equatable {
  const SViewDashboardEvent();

  @override
  List<Object> get props => [];
}

class GenerateView extends SViewDashboardEvent {
  @override
  List<Object> get props => [];
}

class ZaminaHasla extends SViewDashboardEvent {
  const ZaminaHasla(this.haslo);
  final String haslo;
  @override
  List<Object> get props => [];
}
