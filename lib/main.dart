import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyStart(),
    );
  }
}

class MyStart extends StatefulWidget {
  const MyStart({super.key});

  @override
  State<MyStart> createState() => _MyStartState();
}

class _MyStartState extends State<MyStart> {
  @override
  Widget build(BuildContext context) {
    var myWhiteFont = GoogleFonts.pressStart2p(
        textStyle: const TextStyle(
            color: Colors.cyanAccent, letterSpacing: 7, fontSize: 15));
    return IntroductionScreen(
      dotsDecorator: const DotsDecorator(
          activeColor: Colors.cyanAccent, activeSize: Size.fromRadius(7)),
      doneStyle:
          ButtonStyle(textStyle: MaterialStateProperty.resolveWith((states) {
        return const TextStyle(
            color: Colors.cyanAccent,
            fontSize: 21,
            fontWeight: FontWeight.bold);
      })
              // backgroundColor: MaterialStateProperty.resolveWith((states) {
              //   // If the button is pressed, return green, otherwise blue
              //   if (states.contains(MaterialState.pressed)) {
              //     return Colors.green;
              //   }
              //   return Colors.blue;
              // }),
              ),
      globalBackgroundColor: Colors.grey[900],
      pages: [
        PageViewModel(
          decoration: PageDecoration(
            safeArea: 0,
            pageColor: Colors.grey[900],
            titleTextStyle: myWhiteFont,
            bodyTextStyle: myWhiteFont,
            fullScreen: false,
            imagePadding: const EdgeInsets.all(21.0),
            titlePadding: const EdgeInsets.fromLTRB(0, 21, 0, 21),
            bodyPadding: const EdgeInsets.fromLTRB(0, 21, 0, 21),
          ),
          title: "TIC TAC TOE",
          body: "Get your Buddy Along with you!",
          image: Padding(
            padding: const EdgeInsets.fromLTRB(0, 35, 0, 0),
            child: Image.asset("lib/img/tictactoe.png"),
          ),
        )
      ],
      showNextButton: false,
      done: const Text("Done"),
      onDone: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      },
    );
  }
}
