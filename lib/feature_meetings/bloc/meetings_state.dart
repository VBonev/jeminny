part of 'meetings_cubit.dart';

abstract class MeetingsState extends Equatable {
  const MeetingsState();

  @override
  List<Object?> get props => [];
}

class MeetingsInitialState extends MeetingsState {
  const MeetingsInitialState();
}

class MeetingsLoading extends MeetingsState {
  const MeetingsLoading();
}

class MeetingsLoaded extends MeetingsState {
  const MeetingsLoaded(
    this.meetings,
  );

  final List<MeetingModel> meetings;

  @override
  List<Object?> get props => [meetings];
}

class MeetingsError extends MeetingsState {}
