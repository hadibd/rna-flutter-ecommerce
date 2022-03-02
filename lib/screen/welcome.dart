import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rna_furniture/screen/homepage.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Homepage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      constraints: BoxConstraints.expand(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/logo.png',
            height: 150,
            width: 150,
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            'RNA Furniture',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    ));
  }
}
