part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class LoadHomeDataEvent extends HomeEvent {
  @override
  List<Object> get props => [];
}

class HomeNoInternetEvent extends HomeEvent {
  @override
  List<Object> get props => [];
}

class FilterByDateEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class FilterByStarEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}
