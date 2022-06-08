import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DatabaseService extends ChangeNotifier {
  List userList = [];

  void fetchUserList() async {
    String token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyVHlwZSI6IkFHRU5UIiwidXVpZCI6ImIyYWViYjMwLThmM2YtMTFlYy05Y2I2LWY3ZTNmNjY2YTIyMyIsImlzRW1haWxWZXJpZmllZCI6dHJ1ZSwicGhvbmVOdW1iZXIiOiI5NzExMTgxMTk4IiwiZW1haWwiOiJyYWtlc2hzaGFybWEuamFpQGdtYWlsLmNvbSIsIm1hc2tlZEVtYWlsIjoicmFrKioqKioqKioqKioqKmdtYWlsLmNvbSIsImV4aXN0aW5nVXNlciI6ZmFsc2UsImlhdCI6MTY0Nzk0NTA0MSwiZXhwIjoxNjY3OTQ1MDQxfQ.Ng9sm0iJbY7_8BALAq31092He6gOIkmWUMw1dwzsg2E";

    final response = await http.get(
        Uri.https("staging-api.astrotak.com", "/api/relative/all"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });

    final body = json.decode(response.body);
    userList = body["data"]["allRelatives"];
    print(userList);
  }
}
