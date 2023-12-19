import "package:flutter/material.dart";
import "package:my_app/Screens/home.dart";
import "package:my_app/Screens/login.dart";
import "package:my_app/Utilities/routes.dart";
import "package:my_app/Widgets/themes.dart";

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
      theme: MyTheme.lightTheme(),
      darkTheme: MyTheme.darkTheme(),
      debugShowCheckedModeBanner: false,
      initialRoute: RouteSet.homeRoute,
      routes: {
        RouteSet.homeRoute: (context) => const Home(),
        RouteSet.loginRoute: (context) => const Login(),
      },
    );
  }
}
