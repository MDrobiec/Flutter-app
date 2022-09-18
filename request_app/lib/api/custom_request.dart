import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert' as convert;

class CustomRequest {
  Future customRequest(data, url, type) async {
    try {
      if (url == 'https://nodejs-db-esz.herokuapp.com/app/loginWeb') {
        var response = await http.post(Uri.parse(url),
            headers: {
              "Content-Type": "application/x-www-form-urlencoded",
              "Accept": '*/*'
            },
            body: data,
            encoding: convert.Encoding.getByName("utf-8"));

        if (response.statusCode == 200) {
          return response.body;
        } else {
          throw Exception('Failed to load album');
        }
      } else {
        if (type == 'post') {
          var storage = const FlutterSecureStorage();
          var jwt = await storage.read(key: "Authorization");
          var jwtVerificated = jwt?.split(".");
          var payload = json.decode(ascii
              .decode(base64.decode(base64.normalize(jwtVerificated![1]))));
          if (DateTime.fromMillisecondsSinceEpoch(payload["exp"] * 1000)
              .isAfter(DateTime.now())) {
            var token = jwt?.replaceAll('"', '');
            var response = await http.post(Uri.parse(url),
                headers: {
                  "Content-Type": "application/x-www-form-urlencoded",
                  "Accept": '*/*',
                  'Authorization': '$token',
                },
                body: data,
                encoding: convert.Encoding.getByName("utf-8"));

            if (response.statusCode == 200) {
              return response.body;
            } else {
              throw Exception('Failed to load album');
            }
          }
        } else if (type == 'get') {
          var storage = const FlutterSecureStorage();
          var jwt = await storage.read(key: "Authorization");
          var jwtVerificated = jwt?.split(".");
          var payload = json.decode(ascii
              .decode(base64.decode(base64.normalize(jwtVerificated![1]))));
          if (DateTime.fromMillisecondsSinceEpoch(payload["exp"] * 1000)
              .isAfter(DateTime.now())) {
            var token = jwt?.replaceAll('"', '');
            var response = await http.get(
              Uri.parse(url),
              headers: {
                "Content-Type": "application/x-www-form-urlencoded",
                "Accept": '*/*',
                'Authorization': '$token',
              },
            );

            if (response.statusCode == 200) {
              return response.body;
            } else {
              throw Exception('Failed to load album');
            }
          }
        }
      }
    } catch (error) {
      if (kDebugMode) {
        print('error+ $error');
      }
    }
  }
}
