import 'package:skl_idn/api/model/stats.dart';
import 'package:skl_idn/api/service/api_service.dart';
import 'package:flutter/material.dart';

class StatsList extends StatelessWidget {
  const StatsList({
    super.key,
    required this.stats,
  });

  final Future stats;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder (
      future: stats,
      builder: (context, snapShot) {
        if (snapShot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if(snapShot.hasError) {
          return Text('Error : ${snapShot.error}');
        } else if(snapShot.hasData) {
          Stats stats = snapShot.data!;
          return SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: stats.regions!.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
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
                                    '${stats.regions![index].name!}',
                                    style: TextStyle(
                                      fontWeight:
                                      FontWeight.bold,
                                      fontFamily: 'Hesveltica',
                                      fontSize: 10,
                                    ),
                                  ),
                                  Text(
                                    'Positif : ${stats.regions![index].numbers!.infected}',
                                    style: TextStyle(
                                      fontWeight:
                                      FontWeight.bold,
                                      fontFamily: 'Hesveltica',
                                      fontSize: 10,
                                    ),
                                  ),
                                  Text(
                                    'Dead : ${stats.regions![index].numbers!.fatal}',
                                    style: TextStyle(
                                      fontWeight:
                                      FontWeight.bold,
                                      fontFamily: 'Hesveltica',
                                      fontSize: 10,
                                    ),
                                  ),
                                  Text(
                                    'Healthy : ${stats.regions![index].numbers!.recovered}',
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
                );
              },
            ),
          );
        } else {
          return Text('No data available');
        }
      },
    );
  }
}