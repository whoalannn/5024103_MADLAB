import 'package:flutter/material.dart';

void main() => runApp(const ProfileCardApp());

class ProfileCardApp extends StatelessWidget {
  const ProfileCardApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(title: const Text('Profile Card')),
          body: Center(
            child: Card(
              margin: const EdgeInsets.all(24),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(28),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CircleAvatar(
                      radius: 48,
                      child: Icon(Icons.person, size: 55),
                    ),
                    const SizedBox(height: 16),
                    const Text('Flutter Student',
                        style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
                    const Text('B.Tech Information Technology'),
                    const Divider(height: 28),
                    const ListTile(
                      leading: Icon(Icons.email),
                      title: Text('student@example.com'),
                    ),
                    const ListTile(
                      leading: Icon(Icons.code),
                      title: Text('Flutter Developer in Training'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
