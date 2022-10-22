import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dismissible',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 74),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<int> _list = List.generate(100, (index) => index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dismissible'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: _list.length,
          padding: const EdgeInsets.all(10),
          itemBuilder: (context, index) {
            return Dismissible(
              direction: DismissDirection.endToStart,
              background: Container(
                alignment: Alignment.centerRight,
                color: Colors.red,
                child: const Icon(Icons.delete),
              ),
              key: ValueKey<int>(_list[index]),
              child: ListTile(title: Text('item ${_list[index]}')),
              onDismissed: (direction) {
                setState(() {
                  _list.removeAt(index);
                });
              },
            );
          },
        ),
      ),
    );
  }
}
