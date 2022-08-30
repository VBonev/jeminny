import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

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
    final meetings = await _repository.fetchFilters();
    var filteredMeetings = meetings
        .where(
          (meeting) =>
              compare(meeting.platform, search?.platform) &&
              compare(meeting.teamMember, search?.teamMember) &&
              compare(meeting.customer, search?.customer),
        )
        .toList();
    if (filteredMeetings.isNotEmpty) {
      emit(MeetingsLoaded(filteredMeetings));
    } else {
      emit(MeetingsError());
    }
  }

  bool compare(String? one, String? two) {
    return two == null || one?.toLowerCase() == two.toLowerCase();
  }

  static MeetingsCubit of(BuildContext context) =>
      BlocProvider.of<MeetingsCubit>(context);
}
