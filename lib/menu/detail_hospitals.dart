import 'package:flutter/material.dart';
import 'package:skl_idn/api/model/hospital.dart';

class HospitalsDetailScreen extends StatelessWidget {
  const HospitalsDetailScreen({super.key, this.hospital});

  final Hospital? hospital;

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
              Text('Name : ${hospital?.name}', style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold
              ),
              ),
              Text('Region : ${hospital?.region}', style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold
              ),),
              Text('Province : ${hospital?.province}', style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold
              ),),
              Text('Adress : ${hospital?.address}', style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold
              ),),
              Text('Phone Number : ${hospital?.phone}', style: TextStyle(
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
