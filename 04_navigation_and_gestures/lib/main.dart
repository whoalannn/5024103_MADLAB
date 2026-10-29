import 'package:flutter/material.dart';

void main() => runApp(const NavigationApp());

class NavigationApp extends StatelessWidget {
  const NavigationApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Navigation Demo',
        routes: {
          '/': (_) => const HomePage(),
          '/profile': (_) => const ProfilePage(),
        },
        initialRoute: '/',
      );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Home')),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () => ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text('Single tap detected'))),
                onDoubleTap: () => ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text('Double tap detected'))),
                onLongPress: () => ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text('Long press detected'))),
                child: const Card(
                  child: Padding(
                    padding: EdgeInsets.all(24),
                    child: Text('Tap, double-tap, or long-press me'),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/profile'),
                child: const Text('Open Profile'),
              ),
            ],
          ),
        ),
      );
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Profile')),
        body: Center(
          child: ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Back to Home'),
          ),
        ),
      );
}
