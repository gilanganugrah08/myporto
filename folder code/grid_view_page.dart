import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contoh Navigasi',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/sungai': (context) =>
            const MenuPage(menuTitle: 'Sungai', icon: Icons.beach_access),
        '/bukit': (context) =>
            const MenuPage(menuTitle: 'Bukit', icon: Icons.terrain),
        '/suku': (context) =>
            const MenuPage(menuTitle: 'Suku', icon: Icons.museum),
        '/makanan': (context) =>
            const MenuPage(menuTitle: 'Makanan', icon: Icons.restaurant),
        '/kostan': (context) =>
            const MenuPage(menuTitle: 'Kostan', icon: Icons.home),
        '/pasar': (context) =>
            const MenuPage(menuTitle: 'Pasar', icon: Icons.shopping_cart),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void goTo(BuildContext context, String route) {
    debugPrint("Pindah ke: $route"); // DEBUG
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            const MenuPage(menuTitle: 'Halaman Isi', icon: Icons.arrow_back),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Beranda')),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        children: [
          menuButton(
            context,
            'sungai',
            Icons.beach_access,
            '/sungai',
            Colors.red,
          ),
          menuButton(context, 'Bukit', Icons.terrain, '/bukit', Colors.red),
          menuButton(context, 'Suku', Icons.museum, '/suku', Colors.red),
          menuButton(
            context,
            'Makanan',
            Icons.restaurant,
            '/makanan',
            Colors.red,
          ),
          menuButton(context, 'Kostan', Icons.home, '/kostan', Colors.red),
          menuButton(
            context,
            'Pasar',
            Icons.shopping_cart,
            '/pasar',
            Colors.red,
          ),
        ],
      ),
    );
  }

  Widget menuButton(
    BuildContext context,
    String text,
    IconData icon,
    String route,
    Color color,
  ) {
    return ElevatedButton.icon(
      onPressed: () => goTo(context, route),
      icon: Icon(icon),
      label: Text(text),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}

class MenuPage extends StatelessWidget {
  final String menuTitle;
  final IconData icon;

  const MenuPage({super.key, required this.menuTitle, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(menuTitle)),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () => Navigator.pop(context),
          icon: Icon(icon),
          label: const Text('Kembali'),
        ),
      ),
    );
  }
}
