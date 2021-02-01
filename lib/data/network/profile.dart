import 'dart:convert';
import 'dart:io';
import 'package:demo/models/post.dart';
import 'package:demo/providers/profile.dart';
import 'package:demo/providers/profiles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

Future<GetApi> getProfile(BuildContext context) async {
  String url = 'https://randomuser.me/api/';
  final response = await http.get(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  var _data = GetApi.fromJson(jsonDecode(response.body)).results;
  // print(_data[0]['gender']);
  Provider.of<Profiles>(context, listen: false).updateProfile(Profile(
    name: _data[0]['name']['last'] + _data[0]['name']['first'],
    age: _data[0]['dob']['age'],
    gender: _data[0]['gender'],
    email: _data[0]['email'],
    phone: _data[0]['phone'],
    location: _data[0]['location']['country'],
    imageUrl: _data[0]['picture']['large'],
    username: _data[0]['login']['username'],
    registered: _data[0]['registered']['date'].toString().substring(0, 10),
    cell: _data[0]['cell'],
  ));
  print('get');

  if (response.statusCode == 200) {
    // if (GetApi.fromJson(jsonDecode(response.body)).resultCode == 1) {
    //   return GetApi.fromJson(jsonDecode(response.body));
    // }
  } else {
    throw Exception('Failed to get API !');
  }
}
