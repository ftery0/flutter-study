import 'package:flutter/material.dart';

// 앱 진입점
void main() {
  runApp(const MyApp());
}

// StatelessWidget: 상태(state)가 없는 위젯 - 한번 그려지면 변하지 않음
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter 공부',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter 공부'),
    );
  }
}

// StatefulWidget: 상태(state)가 있는 위젯 - setState() 호출 시 화면 다시 그림
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0; // 상태 변수

  void _incrementCounter() {
    setState(() {
      // setState() 안에서 상태를 바꿔야 화면이 다시 그려짐
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('버튼을 누른 횟수:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: '증가',
        child: const Icon(Icons.add),
      ),
    );
  }
}
