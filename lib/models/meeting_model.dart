import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'meeting_model.g.dart';

@JsonSerializable(createToJson: false)
class MeetingModel extends Equatable {
  const MeetingModel({
    required this.title,
    required this.userPhoto,
    required this.noteTakerAddedOn,
    required this.createdAt,
    required this.timeAgo,
    required this.platform,
    required this.teamMember,
    required this.customer,
  });

  final String title;
  final String userPhoto;
  @JsonKey(name: 'notetakerAddedOn')
  final String noteTakerAddedOn;
  final String createdAt;
  final String timeAgo;
  final String platform;
  final String teamMember;
  final String customer;

  factory MeetingModel.fromJson(Map<String, dynamic> json) =>
      _$MeetingModelFromJson(json);

  @override
  List<Object?> get props => [
        title,
        userPhoto,
        noteTakerAddedOn,
        createdAt,
        timeAgo,
        platform,
        teamMember,
        customer,
      ];
}
