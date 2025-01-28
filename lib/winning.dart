import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:tapgame/welcome.dart';

class Winning extends StatefulWidget {
  final String winnerName;
  final int winnerScore;

  const Winning({super.key, required this.winnerName, required this.winnerScore});

  @override
  State<Winning> createState() => _WinningState();
}

class _WinningState extends State<Winning> {
  bool isPlaying = false;
  final controller = ConfettiController(duration: const Duration(seconds: 10)); //Added duration for confetti

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        isPlaying = controller.state == ConfettiControllerState.playing;
      });
    });
    controller.play(); //Start confetti from here
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Scaffold(
          backgroundColor: Colors.black,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage("assets/trophy.png"),
                  height: 200,
                  width: 200,
                ),
                Text(
                  "${widget.winnerName} won the game",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Score : ${widget.winnerScore}",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
                FloatingActionButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Welcome()),
                        (route) => false);
                    // Navigator.pop(context); //No need to use both, remove pop
                  },
                  shape: const CircleBorder(),
                  backgroundColor: Colors.red,
                  child: const Icon(Icons.home),
                )
              ],
            ),
          ),
        ),
        ConfettiWidget(
          confettiController: controller,
          shouldLoop: false, // Changed to false so it's more like a burst effect
          blastDirectionality: BlastDirectionality.explosive,
          //Other Confetti customization options:
          // colors: const [
          //    Colors.green,
          //   Colors.blue,
          //  Colors.pink,
          //  Colors.orange,
          //   Colors.purple
          //  ], // manually specify the colors to be used
          // createParticlePath: drawStar, // define a custom shape/path.
        ),
      ],
    );
  }
}