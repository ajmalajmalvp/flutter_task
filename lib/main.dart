import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:new_test_project/core/constent.dart';
import 'package:new_test_project/screens/home_page/provider/home_provider.dart';
import 'package:new_test_project/screens/home_page/screen_home.dart';
import 'package:new_test_project/screens/login/login_screen.dart';
import 'package:new_test_project/screens/login/provider/sign_in_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SignInProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => HomeProviders(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: FutureBuilder(
      future: getUserTokenSharePref(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        log("${snapshot.data}data data");
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return ScreenLogin();
        } else if (snapshot.hasData) {
          return const ScreenHome();
        } else {
          return ScreenLogin();
        }
      },
    ));
  }
}
