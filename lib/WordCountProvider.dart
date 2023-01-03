import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'DbHelper.dart';

final WordCountProvider = FutureProvider<int>((ref) async {
  return DbHelper.instance.countWords();
});