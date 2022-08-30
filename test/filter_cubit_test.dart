import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jeminny/feature_filter_search/bloc/filter_cubit.dart';
import 'package:jeminny/feature_filter_search/repository/filter_repository.dart';
import 'package:jeminny/models/search_model.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'filter_cubit_test.mocks.dart';

@GenerateMocks([
  FilterRepository,
])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final mockRepository = MockFilterRepository();
  final mockFilters = [
    const SearchModel(title: 'title1'),
    const SearchModel(title: 'title2', platform: 'platform'),
    const SearchModel(title: 'title3', teamMember: 'teamMember'),
  ];
  setUp(() {
    reset(mockRepository);
  });
  group(
    'FilterCubit',
    () {
      blocTest<FilterCubit, FilterState>(
        'emits [] when repository don`t return data',
        build: () {
          when(mockRepository.fetchFilters()).thenAnswer(
            (realInvocation) => Future.value([]),
          );
          return FilterCubit(mockRepository);
        },
        act: (cubit) => cubit.init(),
        expect: () => [
          const FilterLoading(),
          FilterError(),
        ],
      );

      blocTest<FilterCubit, FilterState>(
        'emits FilterLoaded with data when repository return data',
        build: () {
          when(mockRepository.fetchFilters()).thenAnswer(
            (realInvocation) => Future.value(mockFilters),
          );
          return FilterCubit(mockRepository);
        },
        act: (cubit) => cubit.init(),
        expect: () => [
          const FilterLoading(),
          FilterLoaded(mockFilters, null),
        ],
      );

      blocTest<FilterCubit, FilterState>(
        'emits FilterLoaded with selected filter based on title',
        build: () {
          when(mockRepository.fetchFilters()).thenAnswer(
            (realInvocation) => Future.value(mockFilters),
          );
          return FilterCubit(mockRepository);
        },
        seed: () => FilterLoaded(mockFilters, null),
        act: (cubit) => cubit.selectSearch('title2'),
        expect: () => [
          FilterLoaded(
            mockFilters,
            mockFilters[1],
            isFormValid: true,
          )
        ],
      );
      blocTest<FilterCubit, FilterState>(
        'emits FilterLoaded with selected filter based on the filter dropdown',
        build: () {
          when(mockRepository.fetchFilters()).thenAnswer(
            (realInvocation) => Future.value(mockFilters),
          );
          return FilterCubit(mockRepository);
        },
        seed: () => FilterLoaded(mockFilters, null),
        act: (cubit) => cubit.setFilter(mockFilters[1]),
        expect: () => [
          FilterLoaded(
            mockFilters,
            mockFilters[1],
            isFormValid: true,
          )
        ],
      );
      blocTest<FilterCubit, FilterState>(
        'emits FilterLoaded isFormValid when we don`t have selected filter',
        build: () {
          when(mockRepository.fetchFilters()).thenAnswer(
            (realInvocation) => Future.value(mockFilters),
          );
          return FilterCubit(mockRepository);
        },
        seed: () => FilterLoaded(mockFilters, null),
        act: (cubit) => cubit.selectSearch(null),
        expect: () => [
          FilterLoaded(
            mockFilters,
            null,
            isFormValid: false,
          )
        ],
      );
    },
  );
}
