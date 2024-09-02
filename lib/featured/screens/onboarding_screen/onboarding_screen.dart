import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:zeba_books/featured/screens/home_screens/home_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> with SingleTickerProviderStateMixin{

  late final AnimationController _controller ;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat(reverse: true);

    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget buildAnimatedShape(String text, String lottieFile) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Lottie.asset(
          lottieFile,
          width: 150,
          height: 130,
          fit: BoxFit.fill,
          controller: _controller,
        ),
        Text(
          text,
          style: const TextStyle(
              color: Color.fromARGB(255, 27, 20, 53), fontSize: 26, fontWeight: FontWeight.bold),
          textAlign: TextAlign.start,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 36, 34, 34),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 40),
              const Text(
                'Choose Your ',
                style: TextStyle(
                  fontSize: 44,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: "Favourite\t",
                      style: TextStyle(color: Colors.white, fontSize: 44),
                    ),
                    TextSpan(
                      text: "Genre",
                      style: TextStyle(color: Colors.red, fontSize: 44),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                        top: 250,
                        right: -20,
                        child: buildAnimatedShape(
                            'Fantasy', 'assets/lottie_files/lottie3.json')),
                    Positioned(
                        left: -10,
                        child: buildAnimatedShape(
                            'Historical', 'assets/lottie_files/lottie2.json')),
                    Positioned(
                        right: 10,
                        bottom: 50,
                        child: buildAnimatedShape(
                            'Drama', 'assets/lottie_files/lottie5.json')),
                    Positioned(
                        bottom: 70,
                        left: -20,
                        child: buildAnimatedShape(
                            'Novel', 'assets/lottie_files/lottie4.json')),
                    Positioned(
                        bottom: 130,
                        right: 130,
                        child: buildAnimatedShape(
                            'Tragedy', 'assets/lottie_files/lottie1.json')),
                    Positioned(
                        bottom: -50,
                        right: 120,
                        child: buildAnimatedShape(
                            'Detective', 'assets/lottie_files/lottie6.json')),
                    Positioned(
                      bottom: -20,
                      left: 0,
                      child: Lottie.asset(
                        "assets/lottie_files/kfgoRK9S0y.json",
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 200,
                      left: -10,
                      child: Lottie.asset(
                        "assets/lottie_files/kfgoRK9S0y.json",
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: -20,
                      right: 0,
                      child: Lottie.asset(
                        "assets/lottie_files/kfgoRK9S0y.json",
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                       Positioned(
                      bottom: 200,
                      right: 0,
                      child: Lottie.asset(
                        "assets/lottie_files/kfgoRK9S0y.json",
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                     Positioned(
                      bottom: -10,
                      right: 40,
                      child: Image.asset(
                        "assets/images/onboarding1.png",
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                       Positioned(
                      bottom: 120,
                      right: 200,
                      child: Image.asset(
                        "assets/images/onboarding2.png",
                        width: 30,
                        height: 30,
                        fit: BoxFit.cover,
                      ),
                    ),
                      Positioned(
                      bottom: 0,
                      left: 0,
                      child: Image.asset(
                        "assets/images/onboarding3.png",
                        width: 100,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => const HomeScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                    textStyle:
                        const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  child: const Text('Next'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
