import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

var channel = const MethodChannel("testChannel");
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  channel.invokeMethod("test");
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
