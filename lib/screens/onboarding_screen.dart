import 'package:flutter/material.dart';
import '../constants/constants.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  Constants.avocado,
                  height: 250,
                  fit: BoxFit.cover,
                ),
                const Padding(
                  padding: EdgeInsets.all(18.0),
                  child: Text(
                    'We deliver grocery at your doorstep',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Text(
                  'Groceer give you fresh vegetables and fruits, Order fresh items from groceer.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.pushNamedAndRemoveUntil(
                      context, '/', (route) => false),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo.shade300,
                    minimumSize: const Size(200, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text('Get Started'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
