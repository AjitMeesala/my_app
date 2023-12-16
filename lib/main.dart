import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/Screens/home.dart';
import 'package:my_app/Screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Sourcify",
      themeMode: ThemeMode.light,
      theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.deepPurple,
          fontFamily: GoogleFonts.lato().fontFamily),
      darkTheme: ThemeData(brightness: Brightness.dark),
      initialRoute: "/",
      routes: {
        "/Home": (context) => const Home(),
        "/": (context) => const Login(),
      },
    );
  }
}
