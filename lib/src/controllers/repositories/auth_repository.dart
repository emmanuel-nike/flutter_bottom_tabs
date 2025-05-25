import 'dart:convert';
import 'dart:io';

import 'package:flutter_bottom_tabs/src/model/user.dart';

abstract class IAuthRepository {
  Future<User?> getCurrentUser();
}

class AuthRepository implements IAuthRepository {
  @override
  Future<User?> getCurrentUser() async {
    String? userData = await _getCurrentUserFromNetwork();
    return userData != null ? User.fromJson(json.decode(userData)) : null;
  }

  Future<String?> _getCurrentUserFromNetwork() async {
    // Simulating a network call to fetch user data
    await Future.delayed(Duration(seconds: 2));

    // Example user data in JSON format
    String userData = '''{
      "id": 123,
      "name": "Angelina",
      "email": "angelina@mail.com",
      "age": 28
    }''';
    return userData;
  }
}
