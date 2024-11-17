import 'package:flutter/material.dart';
import 'createAccount.dart';
import 'verification.dart'; // Import your new VerifyCodeScreen
// Import your custom color file

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Sign In",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Cursive', // Custom font
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Hi! Welcome back, you’ve been missed",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 40),
              const TextField(
                decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white70),
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 16),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white70),
                  ),
                  suffixIcon: Icon(Icons.visibility_off, color: Colors.white70),
                ),
                style: TextStyle(color: Colors.white),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Forgot password functionality
                  },
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: Color.fromARGB(255, 246, 246, 244),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the Verify Code Screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const VerifyCodeScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 234, 235, 238),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  shadowColor: const Color.fromARGB(255, 60, 120, 175),
                  elevation: 10,
                ),
                child: const Center(
                    child: Text("Sign In",
                        style: TextStyle(color: Colors.black, fontSize: 18))),
              ),
              const SizedBox(height: 20),
              const Text(
                "Or sign in with",
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 20),
              _buildSocialIcons(),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CreateAccountScreen()),
                  );
                },
                child: const Text(
                  "Don't have an account? Sign Up",
                  style: TextStyle(
                    color: Color.fromARGB(255, 247, 247, 245),
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.apple, color: Colors.white),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.g_mobiledata, color: Colors.white),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.facebook, color: Colors.white),
          onPressed: () {},
        ),
      ],
    );
  }
}
