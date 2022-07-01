import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:test/app/models/search_result.dart';
import 'package:test/app/models/search_result_error.dart';

class MockAPI {
  Future<SearchResult> search(String term) async {
    Map<String, dynamic> toMap =
        await parseJsonFromAssets('assets/data/bank.json');
    final response = toMap;

    if (response.isNotEmpty) {
      return SearchResult.fromJson(response);
    } else {
      throw SearchResultError.fromJson(response);
    }
  }

  Future<Map<String, dynamic>> parseJsonFromAssets(String assetsPath) async {
    final json = await rootBundle
        .loadString(assetsPath)
        .then((jsonStr) => jsonDecode(jsonStr));
    // print('--- Parse json from: $assetsPath');
    // print('---  json : $json');
    return json;
  }
}
