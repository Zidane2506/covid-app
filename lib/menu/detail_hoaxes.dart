import 'package:flutter/material.dart';
import 'package:skl_idn/api/model/hoaxes.dart';

class HoaxesDetailScreen extends StatelessWidget {
  const HoaxesDetailScreen({super.key, this.hoaxes});

  final Hoaxes? hoaxes;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${hoaxes?.url}', style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold
              ),),
              Text('Name : ${hoaxes?.title}', style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold
              ),
              ),
              Text('Region : ${hoaxes?.timestamp}', style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold
              ),),
            ],
          ),
        ),
      ),
    );
  }
}
