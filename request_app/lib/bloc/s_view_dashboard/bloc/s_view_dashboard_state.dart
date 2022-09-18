part of 's_view_dashboard_bloc.dart';

abstract class SViewDashboardState extends Equatable {
  const SViewDashboardState();

  @override
  List<Object> get props => [];
}

class SViewDashboardInitial extends SViewDashboardState {
  const SViewDashboardInitial();
  @override
  List<Object> get props => [];
}

class SViewDashboardLoading extends SViewDashboardState {
  const SViewDashboardLoading();
  @override
  List<Object> get props => [];
}

class SViewDashboardLoaded extends SViewDashboardState {
  const SViewDashboardLoaded(this.list, this.listMyUser);
  final List list;
  final List listMyUser;

  @override
  List<Object> get props => [];
}

class SViewDashboardLoadedZmianaHasla extends SViewDashboardState {
  const SViewDashboardLoadedZmianaHasla(this.info);
  final String info;
  @override
  List<Object> get props => [];
}

class SViewDashboardError extends SViewDashboardState {
  const SViewDashboardError(this.message);
  final String message;
  @override
  List<Object> get props => [message];
}
