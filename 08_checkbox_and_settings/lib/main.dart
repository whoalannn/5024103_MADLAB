import 'package:flutter/material.dart';

void main() => runApp(const SettingsApp());

class SettingsApp extends StatelessWidget {
  const SettingsApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const SettingsPage(),
      );
}

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool notifications = true;
  bool darkMode = false;
  bool acceptTerms = false;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('App Settings')),
        body: ListView(
          children: [
            SwitchListTile(
              title: const Text('Enable notifications'),
              value: notifications,
              onChanged: (value) => setState(() => notifications = value),
            ),
            SwitchListTile(
              title: const Text('Dark mode preference'),
              value: darkMode,
              onChanged: (value) => setState(() => darkMode = value),
            ),
            CheckboxListTile(
              title: const Text('I accept the terms and conditions'),
              value: acceptTerms,
              onChanged: (value) => setState(() => acceptTerms = value ?? false),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Notifications: ${notifications ? "On" : "Off"}\n'
                'Dark mode preference: ${darkMode ? "On" : "Off"}\n'
                'Terms accepted: ${acceptTerms ? "Yes" : "No"}',
              ),
            ),
          ],
        ),
      );
}
