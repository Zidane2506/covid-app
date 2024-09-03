import 'package:flutter/material.dart';
import 'package:skl_idn/api/model/news.dart';

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
              Text('${news?.url}', style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold
              ),),
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
