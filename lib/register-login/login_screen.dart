import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 136, 166, 205),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextFormField(

                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 23, 50),
                  ),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    labelStyle: TextStyle(
                      color: Color.fromARGB(255, 0, 45, 98),
                      fontFamily: 'Helvetica',
                    ),
                    border:OutlineInputBorder()
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
