import 'dart:async';

import 'package:flutter/material.dart';
import 'package:newnewsapp/pages/home_screen/home.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = 'splash_screen';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
          children: [
            Container(
              color: Colors.white,
            ),
            Center(
              child: Image.asset('assets/images/splash/pattern.png'),
            ),
            Center(
              child: Image.asset('assets/images/splash/logo_light.png'),
            ),
          ],
        );
  }
}
