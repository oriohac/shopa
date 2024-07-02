import 'package:flutter/material.dart';
import 'package:shopa/screens/screenscon.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        //delay 3 seconds
        future: Future.delayed(const Duration(seconds: 3)),
        builder: (context, timer) => timer.connectionState ==
                ConnectionState.done
            //when delay is over move to Screenscon
            ? const Screenscon()
            //else load the page that contains Tween animation of the app name text
            : Scaffold(
                body: Center(
                  child: TweenAnimationBuilder(
                    //text begins with textSize 6 and ends at 28
                      tween: Tween<double>(begin: 6, end: 28),
                      // Time it takes the animation render
                      duration: const Duration(seconds: 2),
                      builder: (context, value, child) {
                        return Text(
                          'shopa',
                          style: TextStyle(fontSize: value,fontWeight: FontWeight.w600),
                        );
                      }),
                ),
              ));
  }
}
