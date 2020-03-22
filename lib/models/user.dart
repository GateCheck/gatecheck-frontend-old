import 'dart:convert';

import 'package:flutter/material.dart';

class User implements IUser {
  @override
  final AdministrativeLevel administrativeLevel;

  @override
  final IContactInformation contact;

  @override
  final String fullName;

  @override
  final String id;

  @override
  final String idNumber;

  @override
  final UserKind kind;

  @override
  final String loginUsername;

  @override
  final String profilePicture;

  const User(
      {@required this.administrativeLevel,
      @required this.contact,
      @required this.fullName,
      @required this.id,
      @required this.idNumber,
      @required this.kind,
      @required this.loginUsername,
      @required this.profilePicture});

  User copyWith({
    AdministrativeLevel administrativeLevel,
    IContactInformation contact,
    String fullName,
    String id,
    String idNumber,
    UserKind kind,
    String loginUsername,
    String profilePicture,
  }) {
    return User(
      administrativeLevel: administrativeLevel ?? this.administrativeLevel,
      contact: contact ?? this.contact,
      fullName: fullName ?? this.fullName,
      id: id ?? this.id,
      idNumber: idNumber ?? this.idNumber,
      kind: kind ?? this.kind,
      loginUsername: loginUsername ?? this.loginUsername,
      profilePicture: profilePicture ?? this.profilePicture,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'administrativeLevel': administrativeLevel,
      'contact': contact.toMap(),
      'fullName': fullName,
      'id': id,
      'idNumber': idNumber,
      'kind': kind,
      'loginUsername': loginUsername,
      'profilePicture': profilePicture,
    };
  }

  static User fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return User(
      administrativeLevel: map['administrativeLevel'] == 3
          ? AdministrativeLevel.Three
          : map['administrativeLevel'] == 2
              ? AdministrativeLevel.Two
              : AdministrativeLevel.One,
      contact: IContactInformation.fromMap(map['contact']),
      fullName: map['fullName'],
      id: map['id'],
      idNumber: map['idNumber'],
      kind: map['kind'] == 'Student'
          ? UserKind.Student
          : map['kind'] == 'Parent' ? UserKind.Parent : UserKind.Instructor,
      loginUsername: map['loginUsername'],
      profilePicture: map['profilePicture'],
    );
  }

  String toJson() => json.encode(toMap());

  static User fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(administrativeLevel: $administrativeLevel, contact: $contact, fullName: $fullName, id: $id, idNumber: $idNumber, kind: $kind, loginUsername: $loginUsername, profilePicture: $profilePicture)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is User &&
        o.administrativeLevel == administrativeLevel &&
        o.contact == contact &&
        o.fullName == fullName &&
        o.id == id &&
        o.idNumber == idNumber &&
        o.kind == kind &&
        o.loginUsername == loginUsername &&
        o.profilePicture == profilePicture;
  }

  @override
  int get hashCode {
    return administrativeLevel.hashCode ^
        contact.hashCode ^
        fullName.hashCode ^
        id.hashCode ^
        idNumber.hashCode ^
        kind.hashCode ^
        loginUsername.hashCode ^
        profilePicture.hashCode;
  }
}

class ContactInformation implements IContactInformation {
  @override
  final String email;

  @override
  final int phone;

  const ContactInformation({
    this.email,
    this.phone,
  });

  ContactInformation copyWith({
    String email,
    int phone,
  }) {
    return ContactInformation(
      email: email ?? this.email,
      phone: phone ?? this.phone,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'phone': phone,
    };
  }

  static ContactInformation fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ContactInformation(
      email: map['email'],
      phone: map['phone'],
    );
  }

  String toJson() => json.encode(toMap());

  static ContactInformation fromJson(String source) =>
      fromMap(json.decode(source));

  @override
  String toString() => 'ContactInformation(email: $email, phone: $phone)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ContactInformation && o.email == email && o.phone == phone;
  }

  @override
  int get hashCode => email.hashCode ^ phone.hashCode;
}

abstract class IUser {
  final IContactInformation contact;
  final String fullName;
  final String idNumber;
  final String profilePicture;
  final AdministrativeLevel administrativeLevel;
  final String id;
  final String loginUsername;
  final UserKind kind;

  const IUser({
    this.contact,
    this.fullName,
    this.idNumber,
    this.profilePicture,
    this.administrativeLevel,
    this.id,
    this.loginUsername,
    this.kind,
  });

  @override
  String toString() {
    return 'IUser(contact: $contact, fullName: $fullName, idNumber: $idNumber, profilePicture: $profilePicture, administrativeLevel: $administrativeLevel, id: $id, loginUsername: $loginUsername, kind: $kind)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is IUser &&
        o.contact == contact &&
        o.fullName == fullName &&
        o.idNumber == idNumber &&
        o.profilePicture == profilePicture &&
        o.administrativeLevel == administrativeLevel &&
        o.id == id &&
        o.loginUsername == loginUsername &&
        o.kind == kind;
  }

  @override
  int get hashCode {
    return contact.hashCode ^
        fullName.hashCode ^
        idNumber.hashCode ^
        profilePicture.hashCode ^
        administrativeLevel.hashCode ^
        id.hashCode ^
        loginUsername.hashCode ^
        kind.hashCode;
  }

  Map<String, dynamic> toMap();
  static IUser fromMap(Map<String, dynamic> map) {
    return null;
  }
}

abstract class IContactInformation {
  final int phone;
  final String email;

  Map<String, dynamic> toMap();
  static IContactInformation fromMap(Map<String, dynamic> map) {
    return null;
  }

  const IContactInformation({
    this.phone,
    this.email,
  });

  @override
  String toString() => 'IContactInformation(phone: $phone, email: $email)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is IContactInformation && o.phone == phone && o.email == email;
  }

  @override
  int get hashCode => phone.hashCode ^ email.hashCode;
}

enum AdministrativeLevel { One, Two, Three }

enum UserKind { Student, Instructor, Parent }
