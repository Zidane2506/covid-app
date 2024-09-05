import 'package:flutter/material.dart';
import 'package:skl_idn/api/model/news.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailScreen extends StatelessWidget {
  const NewsDetailScreen({super.key, this.news});

  final News? news;

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
                      final url = '${news?.url}';

                      if(await canLaunch(url)) {
                        await launch(url);
                      }
                    },
                    child: Text('Go To The News'),
                ),
              ),
              Text('Name : ${news?.title}', style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold
              ),
              ),
              Text('Region : ${news?.timestamp}', style: TextStyle(
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
