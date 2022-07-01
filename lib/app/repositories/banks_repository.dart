import 'dart:async';

import 'package:test/app/api/bank_api.dart';
import 'package:test/app/models/search_result.dart';
import 'package:test/app/cache/bank_cache.dart';

class BankRepository {
  const BankRepository(this.cache, this.client);

  final BankCache cache;
  final BankAPI client;

  Future<SearchResult> search(String term) async {
    final cachedResult = cache.get(term);
    if (cachedResult != null) {
      return cachedResult;
    }
    final result = await client.search(term);
    cache.set(term, result);
    return result;
  }
}
