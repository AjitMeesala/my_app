import "package:flutter/material.dart";
import "package:my_app/Screens/cart.dart";
import "package:my_app/Screens/home.dart";
import "package:my_app/Screens/login.dart";
import 'package:my_app/Screens/register_page.dart';
import "package:my_app/Utilities/routes.dart";
import "package:my_app/Widgets/themes.dart";
import "package:my_app/core/store.dart";
import "package:velocity_x/velocity_x.dart";

void main() {
  runApp(VxState(store: MyStore(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Sourcify",
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: RouteSet.testRoute,
      routes: {
        "/": (context) => const Login(),
        RouteSet.homeRoute: (context) => const Home(),
        RouteSet.loginRoute: (context) => const Login(),
        RouteSet.cartRoute: (context) => const Cart(),
        RouteSet.testRoute: (context) => const RegisterPage(),
      },
    );
  }
}
