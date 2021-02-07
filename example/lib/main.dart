import 'package:flutter/material.dart';
import 'package:headless_button/headless_button.dart';

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

class SendButton extends StatelessWidget {
  const SendButton({
    Key key,
    this.loading,
    this.onTap,
  }) : super(key: key);

  final bool loading;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return HeadlessButton(
      loading: loading,
      onTap: onTap,
      builder: (context, enable, loading, pressing) {
        return AnimatedOpacity(
          opacity: pressing || !enable ? 0.55 : 1,
          duration: Duration(milliseconds: 160),
          child: Center(
            child: AnimatedContainer(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.black.withOpacity(0.7),
                ),
                borderRadius: BorderRadius.circular(160),
              ),
              padding: EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 16,
              ),
              duration: Duration(milliseconds: 160),
              child: loading
                  ? SizedBox(
                      height: 16,
                      width: 16,
                      child: CircularProgressIndicator(
                        strokeWidth: 1,
                      ),
                    )
                  : Text('Send'),
            ),
          ),
        );
      },
    );
  }
}
