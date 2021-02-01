import 'package:flutter/material.dart';
import './profile.dart';

class Profiles with ChangeNotifier {
  Profile _profile = Profile(
      name: 'Phuc',
      age: 22,
      gender: 'male',
      email: 'nguyentanphucuit@gmail.com',
      phone: '(84) 974224812',
      location: 'VietNam',
      imageUrl: 'https://picsum.photos/250?image=9',
      username: 'nguyentanphuc',
      registered: '2017-02-14',
      cell: '(12) 7448-5919');

  Profile get profile {
    return _profile;
  }

  void updateProfile(Profile prof) {
    _profile = prof;
  }
}
