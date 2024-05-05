import 'package:furnika/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:furnika/core/constraints/constraints.dart';
import 'package:furnika/core/utils/injection_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

String getUserAccessToken() {
  return sl<SharedPreferences>().getString(kAccessToken) ?? '';
}

bool checkIsLoggedIn() {
  return AppUserCubit().state.toString() != 'AppUserInitial()';
}
