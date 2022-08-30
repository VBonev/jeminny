// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meeting_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeetingModel _$MeetingModelFromJson(Map<String, dynamic> json) => MeetingModel(
      title: json['title'] as String,
      userPhoto: json['userPhoto'] as String,
      noteTakerAddedOn: json['notetakerAddedOn'] as String,
      createdAt: json['createdAt'] as String,
      timeAgo: json['timeAgo'] as String,
      platform: json['platform'] as String,
      teamMember: json['teamMember'] as String,
      customer: json['customer'] as String,
    );

Map<String, dynamic> _$MeetingModelToJson(MeetingModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'userPhoto': instance.userPhoto,
      'notetakerAddedOn': instance.noteTakerAddedOn,
      'createdAt': instance.createdAt,
      'timeAgo': instance.timeAgo,
      'platform': instance.platform,
      'teamMember': instance.teamMember,
      'customer': instance.customer,
    };
