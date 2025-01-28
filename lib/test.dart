import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
/*
class TestPart extends StatefulWidget {
  const TestPart({super.key});

  @override
  State<TestPart> createState() => _TestPartState();
}

class _TestPartState extends State<TestPart> {
  bool isPlaying = false;
  final controller = ConfettiController();

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        isPlaying = controller.state == ConfettiControllerState.playing;
      });
    });
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
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: const Text(
              "Animation",
            ),
          ),
          body: Center(
            child: ElevatedButton(
                onPressed: () {
                  if (isPlaying) {
                    controller.stop();
                  } else {
                    controller.play();
                  }
                },
                child: Text(isPlaying ? "Stop" : "Play")),
          ),
        ),
        ConfettiWidget(
          confettiController: controller,
          shouldLoop: true,
          blastDirectionality: BlastDirectionality.explosive,
          //Other Confetti customization options:
          //  colors: const [
          //     Colors.green,
          //     Colors.blue,
          //     Colors.pink,
          //     Colors.orange,
          //    Colors.purple
          //   ], // manually specify the colors to be used
          //  createParticlePath: drawStar, // define a custom shape/path.
        ),
      ],
    );
  }
}*/

/*
import 'dart:async';
import 'package:flutter/material.dart';

class SplashAnimation extends StatefulWidget {
  const SplashAnimation({super.key});

  @override
  State<SplashAnimation> createState() => _SplashAnimationState();
}

class _SplashAnimationState extends State<SplashAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    controller.addListener(() {
      if (controller.isCompleted) {
        Navigator.of(context).push(
          MyCustomRouteTransition(
            route: const Destination(),
          ),
        );

        Timer(const Duration(milliseconds: 500), () {
          controller.reset();
        });
      }
    });

    scaleAnimation = Tween<double>(begin: 1, end: 10).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            controller.forward();
          },
          child: ScaleTransition(
            scale: scaleAnimation,
            child: Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Destination extends StatelessWidget {
  const Destination({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text('Go Back'),
      ),
    );
  }
}

class MyCustomRouteTransition extends PageRouteBuilder {
  final Widget route;
  MyCustomRouteTransition({required this.route})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) {
      return route;
    },
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final tween = Tween(
        begin: const Offset(0, -1),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(parent: animation, curve: Curves.easeInOut),
      );
      return SlideTransition(
        position: tween,
        child: child,
      );
    },
  );
}*/


import 'package:flutter/material.dart';
import 'dart:math';

class SplashAnimation extends StatefulWidget {
  const SplashAnimation({super.key});

  @override
  State<SplashAnimation> createState() => _SplashAnimationState();
}

class _SplashAnimationState extends State<SplashAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800), // Adjust duration for smoothness
    );

    scaleAnimation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Calculate the maximum size dynamically based on screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // The target size of the circle should cover the diagonal of the screen
    final maxSize = (screenWidth * screenWidth + screenHeight * screenHeight);

    return Scaffold(
      body: Stack(
        children: [
          // The background color that fills the screen after the animation
          AnimatedBuilder(
            animation: controller,
            builder: (context, child) {
              return Container(
                color: controller.isCompleted ? Colors.blue : Colors.white,
              );
            },
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                controller.forward();
              },
              child: AnimatedBuilder(
                animation: scaleAnimation,
                builder: (context, child) {
                  return Container(
                    width: 100 + (maxSize - 100) * scaleAnimation.value,
                    height: 100 + (maxSize - 100) * scaleAnimation.value,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}


