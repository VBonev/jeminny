import 'dart:convert';

import 'package:flutter/services.dart';

import '../../constants.dart';
import '../../models/search_model.dart';

class FilterRepository {
  const FilterRepository();

  Future<List<SearchModel>> fetchFilters() async {
    final String response = await rootBundle.loadString(savedSearchPath);
    List<dynamic> data = await json.decode(response);
    final searches = data.map((e) => SearchModel.fromJson(e)).toList();
    return searches;
  }
}
