import 'package:http/http.dart' as http;
// import 'users.dart';//fetch data

class PostServices {
  static const String url = 'http://142.93.217.138/Ctest/shub.php';

  static Future<String> insertData(String mobile, String password) async {
    try {
      var map = new Map<String, dynamic>();

      map["action"] = 'INSERT_DATA';

      map["mobile"] = mobile;
      map["password"] = password;

      final response = await http.post(url, body: map);
      print("addEmployee >> Response:: ${response.body}");
      return response.body;
    } catch (e) {
      return 'error';
    }
  }

  static Future<String> registerData(
      String name, String meetperson, String meettime, String reason) async {
        String time = meetperson,date=meettime,people=reason;
    try {
      print(name + meetperson + meettime + reason);
      var map = new Map<String, dynamic>();

      map["action"] = 'INSERT_REGISTER';

      map["name"] = name;
      map["time"] = time;
      map["date"] = date;
      map["people"] = people;

      final response = await http.post(url, body: map);
      print("addEmployee >> Response:: ${response.body}");
      return response.body;
    } catch (e) {
      return 'error';
    }
  }
}
