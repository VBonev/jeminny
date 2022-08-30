import 'package:json_annotation/json_annotation.dart';

part 'meeting_model.g.dart';

@JsonSerializable()
class MeetingModel {
  MeetingModel({
   required this.title,
    required   this.userPhoto,
    required   this.noteTakerAddedOn,
    required   this.createdAt,
    required   this.timeAgo,
    required   this.platform,
    required   this.teamMember,
    required   this.customer,
  });

  String title;
  String userPhoto;
  @JsonKey(name: 'notetakerAddedOn')
  String noteTakerAddedOn;
  String createdAt;
  String timeAgo;
  String platform;
  String teamMember;
  String customer;

  factory MeetingModel.fromJson(Map<String, dynamic> json) =>
      _$MeetingModelFromJson(json);

  Map<String, dynamic> toJson() => _$MeetingModelToJson(this);
}
