import 'package:http/http.dart' as http;
// import 'users.dart';//fetch data

class PostServices {
  static const String url = 'http://142.93.217.138/Ctest/data.php';

  static Future<String> insertData(String mobile) async {
    try {
      var map = new Map<String, dynamic>();

      map["action"] = 'INSERT_DATA';

      map["mobile"] = mobile;

      final response = await http.post(url, body: map);
      print("addEmployee >> Response:: ${response.body}");
      return response.body;
    } catch (e) {
      return 'error';
    }
  }
}
