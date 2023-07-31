part of 'dashboard_bloc.dart';

abstract class DashboardState extends Equatable {
  const DashboardState();

  @override
  List<Object> get props => [];
}

class DashboardInitial extends DashboardState {}

class DashboardLoading extends DashboardState {}

class BannerLoded extends DashboardState {
  final List<BannerModel> banners;

  BannerLoded(this.banners);
}
