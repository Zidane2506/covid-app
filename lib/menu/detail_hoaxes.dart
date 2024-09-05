import 'package:flutter/material.dart';
import 'package:skl_idn/api/model/hoaxes.dart';
import 'package:url_launcher/url_launcher.dart';

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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                child: ElevatedButton(
                  onPressed: () async {
                    final url = '${hoaxes?.url}';

                    if(await canLaunch(url)) {
                      await launch(url);
                    }
                  },
                  child: Text('Go To The News'),
                ),
              ),
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
