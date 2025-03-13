import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Text( "Texto de exemplo",
            style: TextStyle(
              fontSize: 20,
              color: Colors.amber,
              text("Flutter")
            ),
          ),
        ),
      ),
    );
  }
}
