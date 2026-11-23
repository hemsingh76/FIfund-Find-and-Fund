import 'package:fifund/services/auth_service.dart';
import 'package:flutter/material.dart';

class profilePage extends StatelessWidget {
  const profilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user= AuthService().currentUser;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon
            (Icons.account_circle, size: 80,),
          SizedBox(height: 10),
          Text(
            user?.displayName ?? 'No name',
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Text(user?.email ?? ''),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () => AuthService().logout(),
            icon: const Icon(Icons.logout),
            label: const Text('Log out'),
          ),
        ],
      ),
    );
  }
}
