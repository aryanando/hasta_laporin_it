import 'package:shared_preferences/shared_preferences.dart';

Future<void> logoutUser(Function callback) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('auth_token');

  print("User logged out. Token removed.");
  callback(true);
}
