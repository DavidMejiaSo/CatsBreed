import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/responsive.dart';
import 'package:http/http.dart' as http;

class CatsService {
  Future<dynamic> myCats() async {
    String url = 'https://api.thecatapi.com/v1/breeds';

    final res = await http.get(
      Uri.parse(url),
      headers: {
        'key': 'x-api-key:bda53789-d59e-46cd-9bc4-2936630fde39',
        'Content-Type': 'application/json ',
      },
    );

    dynamic respuesta = json.decode(res.body);

    print(respuesta);
    return respuesta;
  }
}
