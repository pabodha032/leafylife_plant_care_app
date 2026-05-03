import 'package:flutter/material.dart';
import 'OnboardingPage1.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingPage1()),
      );
    });

    return Scaffold(
      backgroundColor: Colors.white,

      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 15, 32, 39),
              Color.fromARGB(255, 44, 119, 68),
            ],
          ),
        ),

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(
                    255,
                    181,
                    244,
                    183,
                  ).withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(Icons.eco, size: 70, color: Color(0xFF4CAF50)),
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                'LeafyLife',
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),

              const SizedBox(height: 10),
              Text(
                'Bring nature to your home',
                style: TextStyle(
                  fontSize: 18,
                  color: const Color.fromARGB(255, 215, 215, 215),
                ),
              ),

              const SizedBox(height: 20),
              const CircularProgressIndicator(
                color: Color.fromARGB(255, 177, 241, 179),
                strokeWidth: 3,
              ),

              const SizedBox(height: 20),

              Container(
                height: 350,
                width: double.infinity,
                decoration: BoxDecoration(),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    "assets/back.png",
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.eco,
                        size: 80,
                        color: Color(0xFF4CAF50),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
