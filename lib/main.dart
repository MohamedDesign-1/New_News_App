
import 'package:flutter/material.dart';
import 'package:newnewsapp/pages/home_screen/home.dart';
import 'package:newnewsapp/pages/splash_screen/splash_screen.dart';
import 'package:newnewsapp/style/app_theme.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: SplashScreen.routeName,
    theme: ThemeApp.lightTheme,
    routes: {
      SplashScreen.routeName: (context) => const SplashScreen(),
      HomeScreen.routeName: (context) => const HomeScreen(),
    },
    );
  }
}
