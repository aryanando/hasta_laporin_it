import 'package:shared_preferences/shared_preferences.dart';

Future<void> logoutUser() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('auth_token');
  print("User logged out. Token removed.");
}
