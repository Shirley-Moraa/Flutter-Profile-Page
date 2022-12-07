// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:profile_user/page/profile_page.dart';
import 'package:profile_user/utils/user_preferences.dart';
import 'package:profile_user/widgets/profile_widget.dart';
import 'package:profile_user/model/user.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await UserPreferences.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return MaterialApp(
      title: 'Flutter Profile Page',
      theme: ThemeData(
        primaryColor: Colors.blue.shade300,
        dividerColor: Colors.black,
      ),
      home: ProfilePage(),
    );
  }
}
