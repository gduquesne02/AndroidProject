import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPrefProvider = FutureProvider<SharedPreferences>((ref) {
  return SharedPreferences.getInstance();
});

final usernameProvider= FutureProvider<String?>((ref) async {
  final SharedPreferences sharedPref = await SharedPreferences.getInstance();
  return sharedPref.getString('username');
});