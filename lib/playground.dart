import 'package:flutter/material.dart';

class Playground extends StatefulWidget {
  const Playground({super.key});

  @override
  State<Playground> createState() => _PlaygroundState();
}

class _PlaygroundState extends State<Playground> {
 double p1Heght = 0;
 double p2Heght = 0;
 int p1Score = 0;
 int p2Score = 0;

 bool heightState =true;
  @override
  Widget build(BuildContext context) {

     if(heightState)
     {
         p1Heght = MediaQuery.of(context).size.height /2;
         p2Heght = MediaQuery.of(context).size.height /2;
         heightState = false;
     }

    return Scaffold(
      body: Column(
        children: [
          MaterialButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              setState(() {
                p1Heght += 10;
                p2Heght -= 10;
                p1Score +=5;
                p2Score -=5;
              });
            },
            child: Container(
              height: p1Heght,
              color: Colors.red,
              child: Padding(
                padding: const EdgeInsets.all(15.0),

                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        "Player 1",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28
                        ),
                    ),
                    Text(
                      "${p1Score}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28
                      ),
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
                p1Heght -= 10;
                p2Heght += 10;
                p2Score +=5;
              });
            },
            child: Container(
              height: p2Heght,
              color: Colors.blue,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Player 2",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28
                      ),
                    ),
                    Text(
                      "${p2Score}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
