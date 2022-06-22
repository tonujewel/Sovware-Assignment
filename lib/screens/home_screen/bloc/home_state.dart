part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeLoadingState extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoadedState extends HomeState {
  final List<HomeHiveDm> homeData ;

  const HomeLoadedState(this.homeData);
  @override
  List<Object?> get props => [];
}

class HomeNoInternetState extends HomeState {
  @override
  List<Object?> get props => [];
}
