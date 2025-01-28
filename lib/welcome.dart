import 'package:flutter/material.dart';
import 'package:tapgame/playground.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final Map<String, Color> colorsMap = {
    "Red": Colors.red,
    "Blue": Colors.blue,
    "Green": Colors.green,
    "Teal": Colors.teal,
  };

  late Color selectedColor1;
  late String selectedColorName1;
  late Color selectedColor2;
  late String selectedColorName2;
  final TextEditingController player1Controller = TextEditingController();
  final TextEditingController player2Controller = TextEditingController();
  late Color player1BgColor;
  late Color player2BgColor;

  @override
  void initState() {
    super.initState();
    selectedColorName1 = colorsMap.keys.first;
    selectedColor1 = colorsMap.values.first;
    selectedColorName2 = colorsMap.keys.first;
    selectedColor2 = colorsMap.values.first;
    player1BgColor = Colors.white;
    player2BgColor = Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tap Game",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF780C28),
      ),
      body: Stack(
        children: [
          Row(
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
                      inputUI(
                        player1Controller,
                        selectedColor1,
                        selectedColorName1,
                            (String? value) {
                          setState(() {
                            selectedColorName1 = value!;
                            selectedColor1 = colorsMap[value]!;
                            player1BgColor = selectedColor1.withOpacity(0.2);
                          });
                        },
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10.0),
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
                      inputUI(
                        player2Controller,
                        selectedColor2,
                        selectedColorName2,
                            (String? value) {
                          setState(() {
                            selectedColorName2 = value!;
                            selectedColor2 = colorsMap[value]!;
                            player2BgColor = selectedColor2.withOpacity(0.2);
                          });
                        },
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: FloatingActionButton(
                onPressed: () => _validateInputs(context),
                backgroundColor: const Color(0xFF780C28),
                child: const Icon(Icons.play_arrow, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget inputUI(TextEditingController controller, Color selectedColor, String selectedColorName, ValueChanged<String?> onChanged) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const SizedBox(height: 10.0),
          TextField(
            controller: controller,
            decoration: const InputDecoration(
              hintText: "Enter the name",
              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
            ),
          ),
          const SizedBox(height: 20.0),
          Container(
            decoration: BoxDecoration(shape: BoxShape.circle, color: selectedColor),
            height: 50,
            width: 50,
          ),
          const SizedBox(height: 20.0),
          DropdownButton<String>(
            value: selectedColorName,
            iconSize: 30,
            style: const TextStyle(color: Colors.black, fontSize: 20),
            items: colorsMap.keys.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }

  void _validateInputs(BuildContext context) {
    if (player1Controller.text.isEmpty || player2Controller.text.isEmpty) {
      _showErrorDialog(context, "Please enter names for both players.");
      return;
    }
    if (selectedColor1 == selectedColor2) {
      _showErrorDialog(context, "Please select different colors for both players.");
      return;
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Playground(
          p1name: player1Controller.text,
          p2name: player2Controller.text,
          p1color: selectedColor1,
          p2color: selectedColor2,
        ),
      ),
    );
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Error"),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Ok"),
            )
          ],
        );
      },
    );
  }
}
