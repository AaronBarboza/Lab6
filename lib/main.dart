import 'package:smart_admin_dashboard/core/constants/color_constants.dart';
import 'package:smart_admin_dashboard/core/init/provider_list.dart';
import 'package:smart_admin_dashboard/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  runApp(MyApp());
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyCAU91Au-lTgTpB1lTxrh7dJ7SY3BlEAbM",
        authDomain: "login-88211.firebaseapp.com",
        databaseURL: "https://login-88211-default-rtdb.firebaseio.com",
        projectId: "login-88211",
        storageBucket: "login-88211.appspot.com",
        messagingSenderId: "1002948662379",
        appId: "1:1002948662379:web:55a2ef5da2d7376f2d4d2e",
        measurementId: "G-2EK1Z674YB"),
  );
}

Widget build(BuildContext context) {
  return MultiProvider(
      providers: [...ApplicationProvider.instance.dependItems],
      child: FutureBuilder(
        builder: (context, snapshot) {
          return MyApp();
        },
        future: null,
      ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Dashboard - Admin Panel v0.1 ',
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(backgroundColor: bgColor, elevation: 0),
        scaffoldBackgroundColor: bgColor,
        primaryColor: greenColor,
        dialogBackgroundColor: secondaryColor,
        textTheme: GoogleFonts.openSansTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
        canvasColor: secondaryColor,
      ),
      home: Login(title: "Wellcome to the Admin & Dashboard Panel"),
    );
  }
}
