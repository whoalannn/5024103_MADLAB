import 'package:flutter/material.dart';

void main() => runApp(const CalculatorApp());

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const CalculatorPage(),
      );
}

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final first = TextEditingController();
  final second = TextEditingController();
  String result = 'Result will appear here';

  void calculate(String op) {
    final a = double.tryParse(first.text);
    final b = double.tryParse(second.text);
    if (a == null || b == null) {
      setState(() => result = 'Please enter two valid numbers');
      return;
    }
    if (op == '/' && b == 0) {
      setState(() => result = 'Cannot divide by zero');
      return;
    }
    final value = switch (op) {
      '+' => a + b,
      '-' => a - b,
      '×' => a * b,
      '/' => a / b,
      _ => 0.0,
    };
    setState(() => result = 'Result: $value');
  }

  @override
  void dispose() {
    first.dispose();
    second.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Simple Calculator')),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(controller: first, keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'First number')),
              TextField(controller: second, keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Second number')),
              const SizedBox(height: 18),
              Wrap(
                spacing: 8,
                children: ['+', '-', '×', '/']
                    .map((op) => ElevatedButton(
                          onPressed: () => calculate(op),
                          child: Text(op),
                        ))
                    .toList(),
              ),
              const SizedBox(height: 18),
              Text(result, style: const TextStyle(fontSize: 20)),
            ],
          ),
        ),
      );
}
