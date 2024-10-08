import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_model.g.dart';

@JsonSerializable(createToJson: false)
class SearchModel extends Equatable {
  const SearchModel({
    required this.title,
    this.platform,
    this.teamMember,
    this.customer,
  });

  final String title;
  final String? platform;
  final String? teamMember;
  final String? customer;

  factory SearchModel.fromJson(Map<String, dynamic> json) =>
      _$SearchModelFromJson(json);

  factory SearchModel.from({
    required String title,
    String? platform,
    String? teamMember,
    String? customer,
  }) =>
      SearchModel(
        title: title,
        platform: platform,
        teamMember: teamMember,
        customer: customer,
      );

  @override
  List<Object?> get props => [
        title,
        platform,
        teamMember,
        customer,
      ];
}
