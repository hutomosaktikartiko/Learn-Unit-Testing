part of 'data_cubit.dart';

@immutable
abstract class DataState {}

class DataInitialState extends DataState {}

class DataLoadingState extends DataState {}

class DataLoadedState extends DataState {
  final DataModel data;

  DataLoadedState({required this.data});
}

class DataErrorState extends DataState {
  final String? message;

  DataErrorState({required this.message});
}
