import 'package:test/app/models/bank_model.dart';

class SearchResult {
  const SearchResult({required this.items});

  final List<GitHub> items;

  static SearchResult fromJson(Map<String, dynamic> json) {
    final items = (json['items'] as List<dynamic>)
        .map((dynamic item) => GitHub.fromJson(item as Map<String, dynamic>))
        .toList();
    return SearchResult(items: items);
  }
}
