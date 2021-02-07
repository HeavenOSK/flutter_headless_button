import 'package:example/send_button.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _loading = false;
  bool _enable = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SendButton(
          onTap: _enable ? () {} : null,
          loading: _loading,
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() {
                _loading = !_loading;
              });
            },
            child: Icon(Icons.refresh),
          ),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                _enable = !_enable;
              });
            },
            child: Icon(Icons.switch_left),
          ),
        ],
      ),
    );
  }
}
