import 'package:flutter/material.dart';

import 'homePage.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({Key? key}) : super(key: key);

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 500,
          height: 500,
          child: FlutterLogo(style: FlutterLogoStyle.horizontal),
        ),
      ),
    );
  }
}
