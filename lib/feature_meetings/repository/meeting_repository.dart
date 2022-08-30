import 'dart:convert';

import 'package:flutter/services.dart';

import '../../models/meeting_model.dart';

class MeetingsRepository {
  const MeetingsRepository();

  Future<List<MeetingModel>> fetchFilters() async {
    final String response =
        await rootBundle.loadString('assets/mocks/meetings.json');
    List<dynamic> data = await json.decode(response);
    final meetings = data.map((e) => MeetingModel.fromJson(e)).toList();
    return meetings;
  }
}
