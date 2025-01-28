import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tapgame/winning.dart';

class Playground extends StatefulWidget {
  final String p1name;
  final String p2name;
  final Color p1color;
  final Color p2color;

  const Playground({
    super.key,
    required this.p1name,
    required this.p2name,
    required this.p1color,
    required this.p2color,
  });

  @override
  State<Playground> createState() => _PlaygroundState();
}

class _PlaygroundState extends State<Playground> {
  double p1Height = 0;
  double p2Height = 0;
  int p1Score = 0;
  int p2Score = 0;
  double maxHeight = 0;

  bool heightState = true;
  int _start = 3;
  bool _showOverlay = true;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start > 0) {
        setState(() {
          _start--;
        });
      } else {
        setState(() {
          _showOverlay = false;
        });
        _timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (heightState) {
      p1Height = MediaQuery.of(context).size.height / 2;
      p2Height = MediaQuery.of(context).size.height / 2;
      maxHeight = MediaQuery.of(context).size.height * 0.7;

      heightState = false;
    }

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              MaterialButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  setState(() {
                    p1Height += 10;
                    p2Height -= 10;
                    p1Score += 5;
                    p2Score -= 5;
                    if (p1Height > maxHeight) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Winning(
                                winnerName: widget.p1name,
                                winnerScore: p1Score,
                              )));
                    }
                  });
                },
                child: Container(
                  height: p1Height,
                  color: widget.p1color,
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.p1name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                          ),
                        ),
                        Text(
                          "$p1Score",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 28),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              MaterialButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  setState(() {
                    p1Height -= 10;
                    p2Height += 10;
                    p2Score += 5;
                    p1Score -= 5;

                    if (p2Height > maxHeight) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Winning(
                                winnerName: widget.p2name,
                                winnerScore: p2Score,
                              )));
                    }
                  });
                },
                child: Container(
                  height: p2Height,
                  color: widget.p2color,
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.p2name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                          ),
                        ),
                        Text(
                          "$p2Score",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 28),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          if (_showOverlay)
            Positioned.fill(
              child: Container(
                color: Colors.black.withOpacity(0.5),
                child: Center(
                  child: _start > 0
                      ? Text(
                    "$_start",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 80,
                    ),
                  )
                      : const Text(
                    "Start Tapping!",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

