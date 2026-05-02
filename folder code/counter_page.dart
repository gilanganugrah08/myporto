import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;

  void _increment() => setState(() => _counter++);
  void _decrement() => setState(() {
        if (_counter > 0) _counter--;
      });
  void _reset() => setState(() => _counter = 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
        leading: const BackButton(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Nilai Counter:',
              style: TextStyle(fontSize: 20, color: Colors.black54),
            ),
            const SizedBox(height: 16),
            Text(
              '$_counter',
              style: const TextStyle(
                fontSize: 80,
                fontWeight: FontWeight.bold,
                color: Color(0xFF5C6BC0),
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Decrement button
                FloatingActionButton(
                  heroTag: 'decrement',
                  onPressed: _decrement,
                  backgroundColor: Colors.red.shade400,
                  foregroundColor: Colors.white,
                  child: const Icon(Icons.remove),
                ),
                const SizedBox(width: 20),
                // Reset button
                FloatingActionButton(
                  heroTag: 'reset',
                  onPressed: _reset,
                  backgroundColor: Colors.grey.shade400,
                  foregroundColor: Colors.white,
                  child: const Icon(Icons.refresh),
                ),
                const SizedBox(width: 20),
                // Increment button
                FloatingActionButton(
                  heroTag: 'increment',
                  onPressed: _increment,
                  backgroundColor: const Color(0xFF5C6BC0),
                  foregroundColor: Colors.white,
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              '- / reset / +',
              style: TextStyle(color: Colors.black38, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}
