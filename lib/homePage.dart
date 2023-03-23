import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool oTurn = true;
  List<String> displayOX = ["", "", "", "", "", "", "", "", ""];

  static var myName = GoogleFonts.pressStart2p(
      textStyle:
          const TextStyle(color: Colors.white, letterSpacing: 3, fontSize: 07));
  static var myFont = GoogleFonts.pressStart2p(
      textStyle:
          const TextStyle(color: Colors.white, letterSpacing: 3, fontSize: 25));
  static var myWhiteFont = GoogleFonts.pressStart2p(
      textStyle:
          const TextStyle(color: Colors.white, letterSpacing: 3, fontSize: 15));
  int filledBox = 0;
  int oScore = 0;
  int xScore = 0;

  void _checkWinner() {
    if (displayOX[0] == displayOX[1] &&
        displayOX[0] == displayOX[2] &&
        displayOX[0] != "") {
      _showDialog(displayOX[0]);
    } else if (displayOX[3] == displayOX[4] &&
        displayOX[3] == displayOX[5] &&
        displayOX[3] != "") {
      _showDialog(displayOX[3]);
    } else if (displayOX[6] == displayOX[7] &&
        displayOX[6] == displayOX[8] &&
        displayOX[6] != "") {
      _showDialog(displayOX[6]);
    } else if (displayOX[0] == displayOX[3] &&
        displayOX[0] == displayOX[6] &&
        displayOX[0] != "") {
      _showDialog(displayOX[0]);
    } else if (displayOX[1] == displayOX[4] &&
        displayOX[1] == displayOX[7] &&
        displayOX[1] != "") {
      _showDialog(displayOX[1]);
    } else if (displayOX[2] == displayOX[5] &&
        displayOX[2] == displayOX[8] &&
        displayOX[2] != "") {
      _showDialog(displayOX[2]);
    } else if (displayOX[0] == displayOX[4] &&
        displayOX[0] == displayOX[8] &&
        displayOX[0] != "") {
      _showDialog(displayOX[0]);
    } else if (displayOX[2] == displayOX[4] &&
        displayOX[2] == displayOX[6] &&
        displayOX[2] != "") {
      _showDialog(displayOX[2]);
    } else if (filledBox == 9) {
      _showDialog("No one is ");
    }
  }

  void _showDialog(String winner) {
    if (winner == "O") {
      oScore++;
    } else if (winner == "X") {
      xScore++;
    }
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(" $winner is the Winner"),
            actions: [
              FloatingActionButton(
                onPressed: () {
                  _clearBoard();
                  Navigator.pop(context);
                },
                child: const Icon(Icons.replay),
              )
            ],
          );
        });
    _clearBoard();
  }

  void _clearBoard() {
    //Navigator.pop(context);
    setState(() {
      filledBox = 0;
      displayOX = ["", "", "", "", "", "", "", "", ""];
      oTurn = true;
    });
  }

  void _tapped(int index) {
    setState(() {
      if (oTurn && displayOX[index] == "") {
        displayOX[index] = "O";
        filledBox += 1;
        // oTurn = !oTurn;
      } else if (!oTurn && displayOX[index] == "") {
        displayOX[index] = "X";
        filledBox += 1;
      }
      oTurn = !oTurn;
      _checkWinner();
    });
  }

  void _clearMatch() {
    setState(() {
      oScore = 0;
      xScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Column(
        children: [
          Expanded(
              child: Container(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 21, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Player(X) ", style: myWhiteFont),
                    // const Spacer(flex: 1),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 21, 0, 0),
                      child: Text(xScore.toString(), style: myWhiteFont),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 21, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Player(O)", style: myWhiteFont),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 21, 0, 0),
                      child: Text(oScore.toString(), style: myWhiteFont),
                    ),
                  ],
                ),
              ),
            ]),
          )),
          Expanded(
            flex: 3,
            child: GridView.builder(
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      _tapped(index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(7))),
                      child: Center(
                          child: Text(displayOX[index], style: myWhiteFont)),
                    ),
                  );
                }),
          ),
          Expanded(
            child: Column(
              children: [
                Text("TiC-Tac-Toe", style: myFont),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 27, 0, 0),
                  child: Text("@rahul0714", style: myName),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 21, 0, 0),
                  child: FloatingActionButton(
                      onPressed: _clearMatch, child: const Icon(Icons.replay)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
