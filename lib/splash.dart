import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import 'home.dart';

class splash extends StatefulWidget {
  @override
  _splashState createState() => new _splashState();
}

class _splashState extends State<splash> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 5,
      navigateAfterSeconds: new Firstroute(),
      image: new Image.asset('caisse.png'),
      backgroundColor: Colors.red,
      loaderColor: Colors.blue,
    );
  }
}
