import 'package:flutter/material.dart';

void main() => runApp(const LayoutApp());

class LayoutApp extends StatelessWidget {
  const LayoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Widgets and Layout')),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.indigo.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text('A Container with padding',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20)),
              ),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.home, size: 40),
                  Icon(Icons.favorite, size: 40, color: Colors.red),
                  Icon(Icons.star, size: 40, color: Colors.amber),
                ],
              ),
              const SizedBox(height: 20),
              const Card(
                child: ListTile(
                  leading: Icon(Icons.phone_android),
                  title: Text('Flutter Widgets'),
                  subtitle: Text('Build interfaces from reusable widgets'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
