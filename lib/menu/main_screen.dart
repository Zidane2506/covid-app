import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:skl_idn/api/service/api_service.dart';
import '../api/model/hospital.dart';
import '../api/model/hoaxes.dart';
import 'package:skl_idn/menu/detail_hospitals.dart';
import '../api/model/news.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'detail_hoaxes.dart';
import 'detail_news.dart';
import 'package:skl_idn/menu/stats_list.dart';

import 'hoaxes_list.dart';
import 'hospital_list.dart';
import 'news_list.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final Future <List<Hospital>?> hospitals = ApiService().getHospital();
  final Future <List<Hoaxes>?> hoaxes = ApiService().getHoaxes();
  final Future <List<News>?> news = ApiService().getNews();
  final Future stats = ApiService().getStats();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            // APPBAR
            Container(
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 215, 225, 232)),
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.local_hospital, size: 50),
                        Text(
                          'HOSPITAL',
                          style: TextStyle(
                              fontFamily: 'Hesveltica',
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hospitals',
                    style: TextStyle(fontSize: 25),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  HospitalList(hospitals: hospitals),
                  SizedBox(
                    height: 15,
                  ),
                  Text('Hoaxes',
                    style: TextStyle(fontSize: 25),
                  ),
                  HoaxesList(hoaxes: hoaxes),
                  SizedBox(
                    height: 15,
                  ),
                  Text('News',
                    style: TextStyle(fontSize: 25),
                  ),
                  NewsList(news: news),
                  SizedBox(
                    height: 15,
                  ),
                  Text('Status',
                    style: TextStyle(fontSize: 25),
                  ),
                  StatsList(stats: stats),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


