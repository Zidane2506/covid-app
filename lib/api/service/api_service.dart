import 'dart:convert';

import 'package:skl_idn/api/config/config.dart';
import 'package:skl_idn/api/model/hoaxes.dart';
import 'package:skl_idn/api/model/hospital.dart';
import 'package:http/http.dart' as http;
import 'package:skl_idn/api/model/news.dart';
import 'package:skl_idn/api/model/stats.dart';

class ApiService {
  //  GET HOSPITALS
  Future<List<News>?> getNews() async {
    var url = Uri.parse('${baseUrl}news');
    print(url);

    var response = await http.get(url);
    print(response.body);

    if (response.statusCode == 200) {
      List<dynamic> jasonResponse = jsonDecode(response.body);
      return jasonResponse
          .map((news) => News.fromJson(news))
          .toList();
    } else {
      print('Request Failed With Status: ${response.statusCode}');
      return null;
    }
  }
  Future<List<Hoaxes>?> getHoaxes() async {
    var url = Uri.parse('${baseUrl}hoaxes');
    print(url);

    var response = await http.get(url);
    print(response.body);

    if (response.statusCode == 200) {
      List<dynamic> jasonResponse = jsonDecode(response.body);
      return jasonResponse
          .map((hoaxes) => Hoaxes.fromJson(hoaxes))
          .toList();
    } else {
      print('Request Failed With Status: ${response.statusCode}');
      return null;
    }
  }
  Future<List<Hospital>?> getHospital() async {
    var url = Uri.parse('${baseUrl}hospitals');
    print(url);

    var response = await http.get(url);
    print(response.body);

    if (response.statusCode == 200) {
      List<dynamic> jasonResponse = jsonDecode(response.body);
      return jasonResponse
          .map((hospital) => Hospital.fromJson(hospital))
          .toList();
    } else {
      print('Request Failed With Status: ${response.statusCode}');
      return null;
    }
  }
  Future<Stats> getStats() async {
    var url = Uri.parse('${baseUrl}stats');
    print(url);

    var response = await http.get(url);
    print(response.body);

    if (response.statusCode == 200) {
      return statsFromJson(response.body);
    } else {
      throw Exception('Failed to load status data');
    }
  }
}
