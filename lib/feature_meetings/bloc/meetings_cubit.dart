import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jeminny/utils/extensions.dart';

import '../../models/meeting_model.dart';
import '../../models/search_model.dart';
import '../repository/meeting_repository.dart';

part 'meetings_state.dart';

class MeetingsCubit extends Cubit<MeetingsState> {
  MeetingsCubit(
    this._repository,
  ) : super(const MeetingsInitialState());
  final MeetingsRepository _repository;

  Future<void> filterSearches(SearchModel? search) async {
    emit(const MeetingsLoading());
    final meetings = await _repository.fetchMeetings();
    var filteredMeetings = meetings
        .where((meeting) =>
            search?.platform.isNullOrEqual(meeting.platform) == true &&
            search?.teamMember.isNullOrEqual(meeting.teamMember) == true &&
            search?.customer.isNullOrEqual(meeting.customer) == true)
        .toList();
    if (filteredMeetings.isNotEmpty) {
      emit(MeetingsLoaded(filteredMeetings));
    } else {
      emit(MeetingsError());
    }
  }
}
