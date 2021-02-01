import 'package:flutter/foundation.dart';

class Profile {
  final String name;
  final int age;
  final String gender;
  final String email;
  final String phone;
  final String location;
  final String imageUrl;
  final String username;
  final String registered;
  final String cell;
  Profile({
    @required this.name,
    @required this.age,
    @required this.gender,
    @required this.email,
    @required this.phone,
    @required this.location,
    @required this.imageUrl,
    @required this.username,
    @required this.registered,
    @required this.cell,
  });
}
