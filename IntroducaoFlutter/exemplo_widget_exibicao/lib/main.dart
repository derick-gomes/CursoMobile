import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Exemplo widgets Exibicao"),
        ),
        body: Center(
          child: Column(
            children: [
              Text(
                "Texto de exemplo",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.amber,
                ),
              ),
              Text(
                "flutter é incrivel",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                  letterSpacing: 2,
                ),
                textAlign: TextAlign.right, 
              ),
              Image.network(
                'https://www.google.com/imgres?q=stand%20ready%20for%20my%20arrival%20worm&imgurl=https%3A%2F%2Fi1.sndcdn.com%2Fartworks-KSXXO8ynW98DT9z0-wzwmyw-t500x500.jpg&imgrefurl=https%3A%2F%2Fsoundcloud.com%2Fmattybotticelli%2Fstand-ready-for-my-arrival&docid=_dZ2mtrUA5pTAM&tbnid=mzuV5dtIJMfwUM&vet=12ahUKEwiVmqGuzoeMAxUAJrkGHeVPFYMQM3oECGkQAA..i&w=500&h=500&hcb=2&ved=2ahUKEwiVmqGuzoeMAxUAJrkGHeVPFYMQM3oECGkQAA',
                
              ),
            ],
          ),
        ),
      ),
    );
  }
}

