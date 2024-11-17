import 'package:flutter/material.dart';
import 'package:hackutd/screens/login.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Gradient background
      body: Container(
        width:
            double.infinity, // Ensure the container takes the full screen width
        height: double
            .infinity, // Ensure the container takes the full screen height
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 155, 199, 235),
              Color.fromARGB(255, 57, 85, 186)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            // Allows scrolling if needed on smaller screens
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Header with an icon
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 10),
                    Text(
                      'Welcome to Credify',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily:
                            'Cursive', // Custom font (make sure to add it in pubspec.yaml)
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Subheading with a message
                const Text(
                  'Where your financial journey begins!',
                  style: TextStyle(
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                    color: Colors.white70,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),

                // Button with shadow
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Login()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 234, 235, 238),
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 32),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    shadowColor: const Color.fromARGB(255, 60, 120, 175),
                    elevation: 10,
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.login, color: Color.fromARGB(255, 7, 3, 3)),
                      SizedBox(width: 10),
                      Text(
                        'Go to Login',
                        style: TextStyle(
                          color: Color.fromARGB(255, 26, 15, 15),
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Footer decoration
                const Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: Column(
                    children: [
                      Icon(Icons.star,
                          color: Color.fromARGB(136, 252, 251, 251), size: 30),
                      SizedBox(height: 10),
                      Text(
                        'We make banking magical!',
                        style: TextStyle(
                          color: Color.fromARGB(153, 255, 254, 254),
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
