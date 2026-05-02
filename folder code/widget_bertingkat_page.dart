import 'package:flutter/material.dart';

class WidgetBertingkatPage extends StatelessWidget {
  const WidgetBertingkatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget Bertingkat'),
        leading: const BackButton(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/60.jpg', width: 500, height: 500),
            const SizedBox(height: 20),
            const Text(
              'Ini adalah aplikasi Flutter',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
