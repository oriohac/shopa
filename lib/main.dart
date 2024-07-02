import 'package:flutter/material.dart';
import 'package:shopa/screens/ordersuccess.dart';
import 'package:shopa/screens/welcome.dart';

void main() {
  runApp(const Shopa());
}

class Shopa extends StatelessWidget {
  const Shopa({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        // create routes
        '/ordersuccess':(context)=> const Ordersuccess()
      },
      // App starts from the welcome page
      home: const Welcome());
  }
}
