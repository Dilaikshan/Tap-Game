import 'package:flutter/material.dart';
/*
class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  // Use a Map instead of two separate lists/maps
  Map<String, Color> colorsMap = {
    "Red": Colors.red,
    "Blue": Colors.blue,
    "Green": Colors.green,
    "Teal": Colors.teal,
  };

  late Color selectedColor1;
  late String selectedColorName1;
  late Color selectedColor2;
  late String selectedColorName2;
  TextEditingController player1Controller = TextEditingController();
  TextEditingController player2Controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Set initial values from our colorsMap:
    selectedColorName1 = colorsMap.keys.toList()[0];
    selectedColor1 = colorsMap.values.toList()[0];
    selectedColorName2 = colorsMap.keys.toList()[0];
    selectedColor2 = colorsMap.values.toList()[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tap Game",
          style: TextStyle(
              fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF780C28),
      ),
      body: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Player 01",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    inputUI(player1Controller,selectedColor1,selectedColorName1,(String? value){
                      setState(() {
                        selectedColorName1 = value!;
                        selectedColor1 = colorsMap[value]!;
                      });
                    })
                  ]
              )
          ),
          const SizedBox(width: 10.0,),
          Expanded(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Player 02",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    inputUI(player2Controller,selectedColor2,selectedColorName2,(String? value){
                      setState(() {
                        selectedColorName2 = value!;
                        selectedColor2 = colorsMap[value]!;
                      });
                    })
                  ]
              )
          )
        ],
      ),
    );
  }

  Widget inputUI(TextEditingController controller, Color selectedColor,String selectedColorName,  ValueChanged<String?> onChanged){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const SizedBox(height: 10.0),
          TextField(
            controller: controller,
            decoration: const InputDecoration(
                hintText: "Enter the name",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)))
            ),
          ),
          const SizedBox(height: 20.0),
          Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: selectedColor),
            height: 50,
            width: 50,
          ),
          const SizedBox(height: 20.0),
          DropdownButton<String>( // Use String as type here
            value: selectedColorName,
            iconSize: 30,
            style: const TextStyle(color: Colors.black, fontSize: 20),
            items: colorsMap.keys.toList().map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: onChanged,
          ),
          // const SizedBox(width: 10.0),
        ],
      ),
    );
  }
}*/


/*
class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  // Use a Map instead of two separate lists/maps
  Map<String, Color> colorsMap = {
    "Red": Colors.red,
    "Blue": Colors.blue,
    "Green": Colors.green,
    "Teal": Colors.teal,
  };

  late Color selectedColor1;
  late String selectedColorName1;
  late Color selectedColor2;
  late String selectedColorName2;
  TextEditingController player1Controller = TextEditingController();
  TextEditingController player2Controller = TextEditingController();
  late Color player1BgColor;
  late Color player2BgColor;

  @override
  void initState() {
    super.initState();
    // Set initial values from our colorsMap:
    selectedColorName1 = colorsMap.keys.toList()[0];
    selectedColor1 = colorsMap.values.toList()[0];
    selectedColorName2 = colorsMap.keys.toList()[0];
    selectedColor2 = colorsMap.values.toList()[0];
    player1BgColor = Colors.white;
    player2BgColor = Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tap Game",
          style: TextStyle(
              fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF780C28),
      ),
      body: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 1000),
                color: player1BgColor,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Player 01",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                      inputUI(player1Controller,selectedColor1,selectedColorName1,(String? value){
                        setState(() {
                          selectedColorName1 = value!;
                          selectedColor1 = colorsMap[value]!;
                          player1BgColor = selectedColor1.withOpacity(0.3);
                        });
                      })
                    ]
                ),
              )
          ),
          const SizedBox(width: 10.0,),
          Expanded(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 1000),
                color: player2BgColor,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Player 02",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                      inputUI(player2Controller,selectedColor2,selectedColorName2,(String? value){
                        setState(() {
                          selectedColorName2 = value!;
                          selectedColor2 = colorsMap[value]!;
                          player2BgColor = selectedColor2.withOpacity(0.2);
                        });
                      })
                    ]
                ),
              )
          ),
        ],
      ),
    );
  }

  Widget inputUI(TextEditingController controller, Color selectedColor,String selectedColorName,  ValueChanged<String?> onChanged){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const SizedBox(height: 10.0),
          TextField(
            controller: controller,
            decoration: const InputDecoration(
                hintText: "Enter the name",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)))
            ),
          ),
          const SizedBox(height: 20.0),
          Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: selectedColor),
            height: 50,
            width: 50,
          ),
          const SizedBox(height: 20.0),
          DropdownButton<String>( // Use String as type here
            value: selectedColorName,
            iconSize: 30,
            style: const TextStyle(color: Colors.black, fontSize: 20),
            items: colorsMap.keys.toList().map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: onChanged,
          ),
          // const SizedBox(width: 10.0),
        ],
      ),
    );
  }
}*/

import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  // Use a Map instead of two separate lists/maps
  Map<String, Color> colorsMap = {
    "Red": Colors.red,
    "Blue": Colors.blue,
    "Green": Colors.green,
    "Teal": Colors.teal,
  };

  late Color selectedColor1;
  late String selectedColorName1;
  late Color selectedColor2;
  late String selectedColorName2;
  TextEditingController player1Controller = TextEditingController();
  TextEditingController player2Controller = TextEditingController();
  late Color player1BgColor;
  late Color player2BgColor;

  bool _showOverlay = false;


  @override
  void initState() {
    super.initState();
    // Set initial values from our colorsMap:
    selectedColorName1 = colorsMap.keys.toList()[0];
    selectedColor1 = colorsMap.values.toList()[0];
    selectedColorName2 = colorsMap.keys.toList()[0];
    selectedColor2 = colorsMap.values.toList()[0];
    player1BgColor = Colors.white;
    player2BgColor = Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tap Game",
          style: TextStyle(
              fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF780C28),
      ),
      body: Stack(
        children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    color: player1BgColor,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Player 01",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                          ),
                          inputUI(player1Controller,selectedColor1,selectedColorName1,(String? value){
                            setState(() {
                              selectedColorName1 = value!;
                              selectedColor1 = colorsMap[value]!;
                              player1BgColor = selectedColor1.withOpacity(0.2);
                            });
                          })
                        ]
                    ),
                  )
              ),
              const SizedBox(width: 10.0,),
              Expanded(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    color: player2BgColor,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Player 02",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                          ),
                          inputUI(player2Controller,selectedColor2,selectedColorName2,(String? value){
                            setState(() {
                              selectedColorName2 = value!;
                              selectedColor2 = colorsMap[value]!;
                              player2BgColor = selectedColor2.withOpacity(0.2);
                            });
                          })
                        ]
                    ),
                  )
              )
            ],
          ),
          // Floating Action Button
          Positioned(
            bottom: 20,
            left: MediaQuery.of(context).size.width/2 - 30,
            child:  FloatingActionButton(
              onPressed: (){
                setState(() {
                  _showOverlay = true;
                });
              },
              backgroundColor: Color(0xFF780C28),
              child: Icon(Icons.play_arrow,color: Colors.white,),

            ),
          ),
          // Overlay
          if (_showOverlay)
            Positioned.fill(
              child: GestureDetector(
                  onTap: (){
                    setState(() {
                      _showOverlay = false;
                    });
                  },
                  child: Container(
                    color: Colors.black.withOpacity(0.5),
                    child: Center(child: Text("Overlay")),
                  )),
            )

        ],
      ),
    );
  }

  Widget inputUI(TextEditingController controller, Color selectedColor,String selectedColorName,  ValueChanged<String?> onChanged){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const SizedBox(height: 10.0),
          TextField(
            controller: controller,
            decoration: const InputDecoration(
                hintText: "Enter the name",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)))
            ),
          ),
          const SizedBox(height: 20.0),
          Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: selectedColor),
            height: 50,
            width: 50,
          ),
          const SizedBox(height: 20.0),
          DropdownButton<String>( // Use String as type here
            value: selectedColorName,
            iconSize: 30,
            style: const TextStyle(color: Colors.black, fontSize: 20),
            items: colorsMap.keys.toList().map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: onChanged,
          ),
          // const SizedBox(width: 10.0),
        ],
      ),
    );
  }
}