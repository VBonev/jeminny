import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jeminny/feature_meetings/bloc/meetings_cubit.dart';
import 'package:jeminny/feature_meetings/repository/meeting_repository.dart';
import 'package:jeminny/models/meeting_model.dart';
import 'package:jeminny/models/search_model.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'meetings_cubit_test.mocks.dart';

@GenerateMocks([
  MeetingsRepository,
])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final mockRepository = MockMeetingsRepository();
  const mockMeetings = [
     MeetingModel(
      title: 'title1',
      teamMember: 'teamMember',
      userPhoto: 'userPhoto1',
      createdAt: 'createdAt1',
      platform: 'platform1',
      noteTakerAddedOn: 'noteTakerAddedOn1',
      customer: 'customer1',
      timeAgo: 'timeAgo1',
    ),
    MeetingModel(
      title: 'title2',
      teamMember: 'teamMember',
      userPhoto: 'userPhoto2',
      createdAt: 'createdAt2',
      platform: 'platform',
      noteTakerAddedOn: 'noteTakerAddedOn2',
      customer: 'customer2',
      timeAgo: 'timeAgo2',
    ),
    MeetingModel(
      title: 'title3',
      teamMember: 'teamMember',
      userPhoto: 'userPhoto3',
      createdAt: 'createdAt3',
      platform: 'platform3',
      noteTakerAddedOn: 'noteTakerAddedOn3',
      customer: 'customer3',
      timeAgo: 'timeAgo3',
    ),
    MeetingModel(
      title: 'title4',
      teamMember: 'teamMember',
      userPhoto: 'userPhoto4',
      createdAt: 'createdAt4',
      platform: 'platform',
      noteTakerAddedOn: 'noteTakerAddedOn4',
      customer: 'customer4',
      timeAgo: 'timeAgo4',
    ),
  ];
  const successFilter = SearchModel(
    title: 'title3',
    teamMember: 'teamMember',
    platform: 'platform',
  );
  const failureFilter = SearchModel(
    title: 'title3',
    teamMember: 'teamMember',
    platform: 'platform2',
  );
  setUp(() {
    reset(mockRepository);
  });

  group(
    'MeetingsCubit',
    () {

      blocTest<MeetingsCubit, MeetingsState>(
        'emits MeetingsError when repository don`t return result',
        build: () {
          when(mockRepository.fetchMeetings()).thenAnswer(
                (realInvocation) => Future.value([]),
          );
          return MeetingsCubit(mockRepository);
        },
        act: (cubit) => cubit.filterSearches(failureFilter),
        expect: () => [
          const MeetingsLoading(),
          MeetingsError(),
        ],
      );
      blocTest<MeetingsCubit, MeetingsState>(
        'emits MeetingsError when there is no result based on the passed filter',
        build: () {
          when(mockRepository.fetchMeetings()).thenAnswer(
            (realInvocation) => Future.value(mockMeetings),
          );
          return MeetingsCubit(mockRepository);
        },
        act: (cubit) => cubit.filterSearches(failureFilter),
        expect: () => [
          const MeetingsLoading(),
          MeetingsError(),
        ],
      );
      blocTest<MeetingsCubit, MeetingsState>(
        'emits MeetingsError when there is no result based on the passed filter',
        build: () {
          when(mockRepository.fetchMeetings()).thenAnswer(
            (realInvocation) => Future.value(mockMeetings),
          );
          return MeetingsCubit(mockRepository);
        },
        act: (cubit) => cubit.filterSearches(successFilter),
        expect: () => [
          const MeetingsLoading(),
          MeetingsLoaded([
            mockMeetings[1],
            mockMeetings[3],
          ]),
        ],
      );
    },
  );
}
