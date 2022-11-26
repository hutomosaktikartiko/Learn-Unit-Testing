import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/data_model.dart';
import '../repositories/data_reposirtory.dart';

part 'data_state.dart';

class DataCubit extends Cubit<DataState> {
  DataCubit({
    required this.dataRepository,
  }) : super(DataInitialState());

  final DataRepository dataRepository;

  Future<void> getData() async {
    try {
      DataModel? data = await dataRepository.getData();
      emit(DataLoadedState(data: data!));
    } catch (error) {
      emit(DataErrorState(message: error.toString()));
    }
  }
}