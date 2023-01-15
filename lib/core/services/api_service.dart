import 'dart:convert';

import 'package:http/http.dart' as http;

//* QUESTO SERVIZIO RESITUISCE IL JSON COME MAP<String,dynamic>
abstract class ApiService {
  Future<Map<String, dynamic>> getData(
      {required String url, required Map<String, dynamic> queryParams});
}

class ApiServiceImpl implements ApiService {
  @override
  Future<Map<String, dynamic>> getData(
      {required String url, required Map<String, dynamic> queryParams}) async {
    final response =
        await http.get(Uri.parse(url).replace(queryParameters: queryParams));
    if (response.statusCode == 200) {
      return json.decode(response.body) as Map<String, dynamic>;
    } else {
      //*non ho trovato i dati
      throw Exception("Status code: ${response.statusCode}");
    }
  }
}
