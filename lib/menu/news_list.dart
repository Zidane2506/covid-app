import 'package:skl_idn/api/model/news.dart';
import 'package:skl_idn/api/service/api_service.dart';
import 'package:flutter/material.dart';

import 'detail_news.dart';

class NewsList extends StatelessWidget {
  const NewsList({
    super.key,
    required this.news,
  });

  final Future<List<News>?> news;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder <List<News>?>(
      future: news,
      builder: (context, snapShot) {
        if (snapShot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapShot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NewsDetailScreen(
                            news :snapShot.data![index]
                        )),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: SizedBox(
                      height: 50,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 14),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${snapShot.data![index].title}',
                                      style: TextStyle(
                                        fontWeight:
                                        FontWeight.bold,
                                        fontFamily: 'Hesveltica',
                                        fontSize: 10,
                                      ),
                                    ),
                                    Text(
                                      '${snapShot.data![index].timestamp}',
                                      style: TextStyle(
                                        fontWeight:
                                        FontWeight.bold,
                                        fontFamily: 'Hesveltica',
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}