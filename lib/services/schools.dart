import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

const String baseUrl = "https://gatecheck-backend.herokuapp.com/api";

Future<List<dynamic>> getSchools() async {
  http.Response res = await http.get(baseUrl + "/schools");
  if (res.statusCode == 200) {
    return convert.jsonDecode(res.body)['schools'];
  } else {
    throw new Error();
  }
}

Future<List<String>> getSchoolNames() async {
  try {
    List<dynamic> schoolsJson = await getSchools();
    return schoolsJson.map((school) {
      return school['name'] as String;
    }).toList();
  } catch (dynamic) {
    throw new Error();
  }
}
