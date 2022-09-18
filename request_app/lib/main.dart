import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:request_app/screens/s_view_dashboard.dart';
import 'package:request_app/screens/s_view_login.dart';
import 'package:sizer/sizer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  var storage = const FlutterSecureStorage();
  Future<String> get jwtOrEmpty async {
    var jwt = await storage.read(key: "Authorization");
    if (jwt == null) return "";
    return jwt;
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
          title: 'System zgłoszeń',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          debugShowCheckedModeBanner: false,
          home: FutureBuilder(
              future: Future.wait([jwtOrEmpty]),
              builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                if (!snapshot.hasData) {
                } else {
                  var str = snapshot.data![0];
                  if (snapshot.data![0] != "") {
                    var jwt = str.split(".");
                    if (jwt.length != 3) {
                    } else {
                      var payload = json.decode(ascii
                          .decode(base64.decode(base64.normalize(jwt[1]))));
                      if (DateTime.fromMillisecondsSinceEpoch(
                              payload["exp"] * 1000)
                          .isAfter(DateTime.now())) {
                        return const SViewDashboard();
                      } else {
                        return const SViewLogin();
                      }
                    }
                  }
                }
                return const SViewLogin();
              }));
    });
  }
}
