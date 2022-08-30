// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchModel _$SearchModelFromJson(Map<String, dynamic> json) => SearchModel(
      title: json['title'] as String,
      platform: json['platform'] as String?,
      teamMember: json['teamMember'] as String?,
      customer: json['customer'] as String?,
    );

Map<String, dynamic> _$SearchModelToJson(SearchModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'platform': instance.platform,
      'teamMember': instance.teamMember,
      'customer': instance.customer,
    };
