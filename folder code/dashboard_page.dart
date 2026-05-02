import 'package:flutter/material.dart';
import 'counter_page.dart';
import 'widget_bertingkat_page.dart';
import 'user_input_page.dart';
import 'dynamic_list_page.dart';
import 'navigasi_sederhana_page.dart';
import 'grid_view_page.dart';
import 'tentang_saya_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  // Track which buttons have been clicked
  final Set<int> _clickedButtons = {};

  final List<Map<String, dynamic>> _menuItems = [
    {'title': 'Counter', 'index': 0},
    {'title': 'Widget Bertingkat', 'index': 1},
    {'title': 'User Input Example', 'index': 2},
    {'title': 'Dynamic List Example', 'index': 3},
    {'title': 'Navigasi Sederhana', 'index': 4},
    {'title': 'Grid View', 'index': 5},
    {'title': 'Tentang Saya', 'index': 6},
  ];

  void _navigateTo(int index) {
    setState(() {
      _clickedButtons.add(index);
    });

    Widget page;
    switch (index) {
      case 0:
        page = const CounterPage();
        break;
      case 1:
        page = const WidgetBertingkatPage();
        break;
      case 2:
        page = const UserInputPage();
        break;
      case 3:
        page = const DynamicListExample();
        break;
      case 4:
        page = const NavigasiSederhanaPage();
        break;
      case 5:
        page = const HomePage();
        break;
      case 6:
        page = const TentangSayaPage();
        break;
      default:
        return;
    }

    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MyPorto')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Cek hasil karyaku disini:',
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                itemCount: _menuItems.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, i) {
                  final item = _menuItems[i];
                  final idx = item['index'] as int;
                  final isClicked = _clickedButtons.contains(idx);

                  return SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () => _navigateTo(idx),
                      style: OutlinedButton.styleFrom(
                        backgroundColor: isClicked
                            ? const Color(0xFF5C6BC0).withOpacity(0.15)
                            : const Color(0xFFEEEEEE),
                        foregroundColor: isClicked
                            ? const Color(0xFF3949AB)
                            : Colors.black87,
                        side: BorderSide(
                          color: isClicked
                              ? const Color(0xFF5C6BC0)
                              : Colors.transparent,
                          width: 1.5,
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        item['title'] as String,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
