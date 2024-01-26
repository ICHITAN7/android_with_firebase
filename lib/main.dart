import 'package:android_with_firebase/Components/colors.dart';
import 'package:android_with_firebase/Components/text_style.dart';
import 'package:android_with_firebase/Components/theme.dart';
import 'package:android_with_firebase/Controller/notification.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'Screen/EmailPasswordAuth/login_screen.dart';
import 'Screen/HomeScreen/home_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseApi().notification();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: HThemeApp.lighTheme,
      darkTheme: HThemeApp.darkTheme,
      debugShowCheckedModeBanner: false,
      home:FirebaseAuth.instance.currentUser!=null? const HomePage() :const LoginScreen(),
    );
  }
}
