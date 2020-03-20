import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

const String baseUrl = "https://gatecheck-backend.herokuapp.com/api";

Future<String> login(String username, String password) async {
  try {
    http.Response res = await http.post(baseUrl + "/user/login",
        body: Map.fromEntries([
          MapEntry("loginUsername", username),
          MapEntry("password", password)
        ]));
    if (res.statusCode == 200) {
      return convert.jsonDecode(res.body)['token'];
    } else {
      throw new ArgumentError('Username or password invalid!');
    }
  } catch (Error) {
    throw new ArgumentError('Username or password invalid!');
  }
}
