Look to this code to understand how to use this library

```dart
import 'package:flutter/material.dart';
import 'package:wave_loading_indicator/wave_progress.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _progress = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: WaveProgress(
          borderSize: 3.0,
          size: 180,
          borderColor: Colors.redAccent,
          foregroundWaveColor: Colors.greenAccent,
          backgroundWaveColor: Colors.blueAccent,
          progress: _progress,
          innerPadding: 10,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), 
    );
  }

  void _incrementCounter() {
    setState(() {
      _progress += 10;
      if (_progress > 100) {
        _progress = 0;
      }
    });
  }
}

```