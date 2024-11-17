import 'package:flutter/material.dart';

class EducationPage extends StatelessWidget {
  const EducationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Learn How to Use the App',
          style: TextStyle(
            fontFamily: 'Cursive',
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 155, 199, 235),
              Color.fromARGB(255, 57, 85, 186),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              _buildEducationTile(
                context,
                title: 'How to Transfer Money',
                subtitle: 'Learn step-by-step how to transfer money.',
                icon: Icons.monetization_on,
              ),
              _buildEducationTile(
                context,
                title: 'How to Deposit Checks',
                subtitle: 'Discover how to use the camera to deposit checks.',
                icon: Icons.camera_alt,
              ),
              _buildEducationTile(
                context,
                title: 'Using the Live Chat Bot',
                subtitle: 'Learn how to interact with the live chat feature.',
                icon: Icons.chat_bubble_outline,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEducationTile(BuildContext context,
      {required String title,
      required String subtitle,
      required IconData icon}) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(icon, color: Colors.blueAccent),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(
            color: Colors.black54,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.blueAccent,
        ),
        onTap: () {
          // Handle tap action
        },
      ),
    );
  }
}
