import 'package:furnika/core/constraints/constraints.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool checkIsFirstTime(SharedPreferences sharedPreferences) {
  return sharedPreferences.getBool(kFirstTime) ?? true;
}
