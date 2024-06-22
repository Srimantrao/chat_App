// ignore_for_file: prefer_const_constructors

// web       1:341930189895:web:2cabf4d569220669c2fd62
// android   1:341930189895:android:fcb07b2ec0ea4094c2fd62
// ios       1:341930189895:ios:25ece95bad692e48c2fd62
// macos     1:341930189895:ios:0eb597930c557386c2fd62

import 'package:chat_app/controller/statehendle/SinupController/sinup_controller.dart';
import 'package:chat_app/controller/statehendle/SinupController/vaildation_controller.dart';
import 'package:chat_app/view/screen/splash/google_login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SinupController()),
        ChangeNotifierProvider(create: (_) => VaildationController()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: GoogleFonts.openSans().fontFamily,
        ),
        home: GoogleLogin(),
      ),
    );
  }
}
