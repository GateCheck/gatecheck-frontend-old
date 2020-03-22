import 'package:gatecheck_frontend_flutter/models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

const String baseUrl = "https://gatecheck-backend.herokuapp.com/api";

Future<User> getUserData(String token) async {
  try {
    http.Response res = await http.get('$baseUrl/user',
        headers: Map.fromEntries([MapEntry("Authorization", 'Bearer $token')]));
    dynamic json = convert.jsonDecode(res.body)['user'];
    return User(
        administrativeLevel: json['administrative_level'] == 3
            ? AdministrativeLevel.Three
            : json['administrative_level'] == 2
                ? AdministrativeLevel.Two
                : AdministrativeLevel.One,
        contact: ContactInformation(
            email: json['contact']['email'], phone: json['contact']['phone']),
        fullName: json['full_name'],
        id: json['_id'],
        idNumber: json['id_number'],
        kind: json['kind'] == 'Student'
            ? UserKind.Student
            : json['kind'] == 'Parent' ? UserKind.Parent : UserKind.Instructor,
        loginUsername: json['loginUsername'],
        profilePicture: json['profile_picture']);
  } catch (err) {
    throw ArgumentError("Not authenticated");
  }
}
