import 'package:flutter/material.dart';

class TransferPage extends StatelessWidget {
  const TransferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Transfer',
          style: TextStyle(
            fontFamily: 'Cursive',
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.blueAccent, // Bright and inviting color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextField(
              decoration: InputDecoration(
                hintText: 'Search or enter recipient name',
                prefixIcon: Icon(Icons.search, color: Colors.blueAccent),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                filled: true,
                fillColor: Color.fromARGB(255, 245, 245, 245),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                children: [
                  _buildTransferOption(
                      icon: Icons.compare_arrows,
                      label: 'Transfer',
                      context: context),
                  _buildTransferOption(
                      icon: Icons.attach_money,
                      label: 'Zelle®',
                      context: context),
                  _buildTransferOption(
                      icon: Icons.receipt,
                      label: 'Pay Bills',
                      context: context),
                  _buildTransferOption(
                      icon: Icons.public, label: 'Wire', context: context),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Recent Activity',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontFamily: 'Cursive',
                color: Colors.blueAccent,
              ),
            ),
            _buildActivityItem(
                'Lucy James', 'Nov 15, 2024', '\$12.00', context),
            _buildActivityItem(
                'Angie Road', 'Nov 14, 2024', '\$12.00', context),
            TextButton(
              onPressed: () {
                // Handle 'More Activity' action
              },
              child: const Text(
                'MORE ACTIVITY',
                style: TextStyle(color: Colors.blueAccent),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Accounts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.payment),
            label: 'Pay & Transfer',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt),
            label: 'Deposit Checks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Learn',
          ),
        ],
        backgroundColor: Colors.blueAccent,
        unselectedItemColor: Colors.white70,
        selectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  Widget _buildTransferOption(
      {required IconData icon,
      required String label,
      required BuildContext context}) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.blue[100]!,
            Colors.blue[300]!,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.blueAccent.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 48, color: Colors.white),
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'Cursive',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActivityItem(
      String name, String date, String amount, BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blueAccent,
          child: Text(
            name[0],
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        title: Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(date),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              amount,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            const Text(
              'You paid',
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
