import 'package:flutter/material.dart';
//import 'colors.dart'; // Import your custom color file
import 'verification.dart'; // Import your existing VerifyCodeScreen

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

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
                "Create Account",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Cursive',
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Fill your information below or register with your social account.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 32),
              _buildTextField(label: "Name"),
              const SizedBox(height: 16),
              _buildTextField(label: "Email"),
              const SizedBox(height: 16),
              _buildTextField(
                label: "Password",
                obscureText: true,
                suffixIcon:
                    const Icon(Icons.visibility_off, color: Colors.white70),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: true,
                    onChanged: (value) {},
                    activeColor: Colors.white,
                  ),
                  const Text(
                    "Agree with ",
                    style: TextStyle(color: Colors.white),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Terms & Condition",
                      style: TextStyle(
                        color: Color.fromARGB(255, 243, 242, 240),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const VerifyCodeScreen(),
                    ),
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
                  child: Text(
                    "Sign Up",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Or sign up with",
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 20),
              _buildSocialIcons(),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "Already have an account? Sign In",
                  style: TextStyle(
                    color: Color.fromARGB(255, 246, 246, 243),
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

  Widget _buildTextField({
    required String label,
    bool obscureText = false,
    Widget? suffixIcon,
  }) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white),
        border: const OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white70),
          borderRadius: BorderRadius.circular(10),
        ),
        suffixIcon: suffixIcon,
      ),
      style: const TextStyle(color: Colors.white),
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
