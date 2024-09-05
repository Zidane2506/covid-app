import 'package:skl_idn/api/model/hospital.dart';
import 'package:skl_idn/api/service/api_service.dart';
import 'package:flutter/material.dart';

import 'detail_hospitals.dart';

class HospitalList extends StatelessWidget {
  const HospitalList({
    super.key,
    required this.hospitals,
  });

  final Future<List<Hospital>?> hospitals;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder <List<Hospital>?>(
      future: hospitals,
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
                        builder: (context) => HospitalsDetailScreen(
                            hospital :snapShot.data![index]
                        )),
                  ),
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
                                    '${snapShot.data![index].name}',
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
        }
      },
    );
  }
}