import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Récupération',
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key}); // ✅ kenet "new"

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();
  String _valeuraffichee = "";

  void _copier() {
    setState(() {
      _valeuraffichee = _controller.text;
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // ✅ bech yfarragh el mémoire
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recuperation'),
        leading: const Icon(Icons.menu),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.tab_sharp)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 32),
            SizedBox(
              width: 400,
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.text_fields),
                  suffixIcon: Icon(Icons.clear),
                  labelText: 'Récupération',
                  hintText: 'Récupération',
                  helperText: 'Récupération du zone de texte',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _copier,
              child: const Text('Copier'),
            ),
            const SizedBox(height: 16),
            Text(_valeuraffichee, style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}