import 'package:flutter/material.dart';

void main() => runApp(const ListViewApp());

class ListViewApp extends StatelessWidget {
  const ListViewApp({super.key});

  final items = const ['Home', 'Profile', 'Courses', 'Assignments', 'Results',
    'Attendance', 'Settings', 'Help', 'About', 'Contact'];

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(title: const Text('Scrollable List')),
          body: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) => ListTile(
              leading: CircleAvatar(child: Text('${index + 1}')),
              title: Text(items[index]),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Selected: ${items[index]}')),
              ),
            ),
          ),
        ),
      );
}
