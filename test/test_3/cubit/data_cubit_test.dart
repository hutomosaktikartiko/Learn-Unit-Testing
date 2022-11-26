import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:unit_testing/test_3/cubit/data_cubit.dart';
import 'package:unit_testing/test_3/models/data_model.dart';
import 'package:unit_testing/test_3/repositories/data_reposirtory.dart';

class MockDataRepository extends Mock implements DataRepository {}

void main() {
  late DataCubit dataCubit;
  late DataRepository mockDataRepository;

  // Initial
  setUp(() {
    mockDataRepository = MockDataRepository();
    dataCubit = DataCubit(dataRepository: mockDataRepository);
  });

  // Dispose
  tearDown(() {
    dataCubit.close();
  });

  group("DataCubit State - ", () {
    final tDataMap = {
      "userId": 1,
      "id": 1,
      "title": "delectus aut autem",
      "completed": false
    };
    test("should be initial state [DataInitialState]", () {
      expect(dataCubit.state.runtimeType, DataInitialState);
    });

    blocTest(
      "should be success state [DataLoadedState]",
      build: () => dataCubit,
      act: (DataCubit dataCubit) {
        // Arrange
        when(() => mockDataRepository.getData())
            .thenAnswer((_) async => DataModel.fromJson(tDataMap));

        // Actual
        dataCubit.getData();
      },
      expect: () => [
        // Assert
        isA<DataLoadedState>(),
      ],
    );

    blocTest(
      "should be error state [DataErrorState]",
      build: () => dataCubit,
      act: (DataCubit dataCubit) {
        // Arrange
        when(() => mockDataRepository.getData()).thenThrow("error");

        // Actual
        dataCubit.getData();
      },
      expect: () => [
        // Assert
        isA<DataErrorState>(),
      ],
    );
  });
}
