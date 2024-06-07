import 'package:google_clone_app/config/api_json.dart';
import 'package:google_clone_app/config/api_keys.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  bool isDummyData = true;

  Future<Map<String, dynamic>> fetchData(
      {required String queryTerm, String start = "0"}) async {
    try {
      if (!isDummyData) {
        //the search input is split into two diff arrays and again joined using %20 basically + symbol
        String q = queryTerm.contains(' ')
            ? queryTerm.split(' ').join('%20')
            : queryTerm;

        final response = await http.get(
          Uri.parse(
              'https://www.googleapis.com/customsearch/v1?key=${apiKey}&cx=$contextKey&q=$q&start=$start'),
        );
        if (response.statusCode == 200) {
          final jsonData = response.body;
          final resData = json.decode(jsonData);
          return resData;
        }
      }
    } catch (e) {
      print(e.toString());
    }
    return apiResponse;
  }
}
