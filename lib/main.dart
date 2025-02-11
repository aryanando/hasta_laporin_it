import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hasta_laporin_it/pages/home/home.dart';
import 'package:hasta_laporin_it/pages/login/login.dart';
import 'package:hasta_laporin_it/pages/login/token_check.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool _loggedIn = false;

  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    print("Checking Authentication");
    bool loggedIn = await fetchUserData();
    setState(() {
      _loggedIn = loggedIn;
    });
    FlutterNativeSplash.remove();
    print("Removing Splash Screen");
  }

  @override
  Widget build(BuildContext context) {
    if (!_loggedIn) {
      return MaterialApp(home: LoginPage());
    } else {
      return MaterialApp(home: HomePage());
    }
  }
}
