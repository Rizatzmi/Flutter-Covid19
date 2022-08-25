import 'dart:convert';
import 'package:covid19/data/models/models.dart';
import 'package:http/http.dart' as http;

class Repository {
  final _statUrl = 'https://data.covid19.go.id/public/api/update.json';
  final _vaksinUrl = 'https://data.covid19.go.id/public/api/pemeriksaan-vaksinasi.json';

  Future<Stat>fetchStat() async {

      final response = await http.get(Uri.parse(_statUrl));

      if (response.statusCode == 200) {
        return Stat.fromJson(jsonDecode(response.body));
      }

      else {
        throw Exception('failed');
      }
    
  }

  Future<Vaksin>fetchVaksin() async {
    
    final response = await http.get(Uri.parse(_vaksinUrl));

    if (response.statusCode == 200) {
      return Vaksin.fromJson(jsonDecode(response.body));
    }

    else {
      throw Exception();
    }
  }

}