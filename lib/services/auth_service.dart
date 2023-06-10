import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:socket_chat_app/global/environment.dart';
import 'package:socket_chat_app/models/mensajes_model.dart';
import 'package:socket_chat_app/models/user_model.dart';

class AuthService extends ChangeNotifier {
  late UserModel usuario;
  // Create storage
  final _storage = const FlutterSecureStorage();

  bool _autenticando = false;
  bool get autenticando => _autenticando;
  set autenticando(bool value) {
    _autenticando = value;
    notifyListeners();
  }

  static Future<String> getToken() async {
    const storage = FlutterSecureStorage();
    final token = await storage.read(key: 'token');
    return token ?? '';
  }

  static Future<void> deleteToken() async {
    const storage = FlutterSecureStorage();
    await storage.delete(key: 'token');
  }

  Future login(String mail, String password) async {
    this.autenticando = true;
    final data = {
      'email': mail,
      'password': password,
    };

    final uri = Environment.apiUrl('login/');

    final resp = await http.post(
      uri,
      body: jsonEncode(data),
      headers: {'Content-Type': 'application/json'},
    );

    this.autenticando = false;
    if (resp.statusCode == 200) {
      log(_formatResponseLog(resp, requestBody: data));

      final loginResponse = loginResponseFromJson(resp.body);
      usuario = loginResponse.usuario;

      await _guardarToken(loginResponse.token);

      return true;
    } else {
      log(_formatResponseLog(resp, requestBody: data));
      return false;
    }
  }

  Future register(String name, String mail, String password) async {
    this.autenticando = true;
    final data = {
      'nombre': name,
      'email': mail,
      'password': password,
    };

    final uri = Environment.apiUrl('login/new/');

    final resp = await http.post(
      uri,
      body: jsonEncode(data),
      headers: {'Content-Type': 'application/json'},
    );

    this.autenticando = false;
    if (resp.statusCode == 200) {
      log(_formatResponseLog(resp, requestBody: data));

      final loginResponse = loginResponseFromJson(resp.body);
      usuario = loginResponse.usuario;

      await _guardarToken(loginResponse.token);

      return true;
    } else {
      log(_formatResponseLog(resp, requestBody: data));
      final respBody = jsonDecode(resp.body);
      return respBody['msg'];
    }
  }

  Future<bool> isLoggedIn() async {
    final token = await _storage.read(key: 'token');

    final uri = Environment.apiUrl('login/renew/');
    final resp = await http.get(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'x-token': token ?? '',
      },
    );

    this.autenticando = false;
    log(_formatResponseLog(resp));
    if (resp.statusCode == 200) {
      final loginResponse = loginResponseFromJson(resp.body);
      usuario = loginResponse.usuario;

      await _guardarToken(loginResponse.token);

      return true;
    } else {
      logout();
      return false;
    }
  }

  Future _guardarToken(String token) async {
    return _storage.write(key: 'token', value: token);
  }

  Future logout() async {
    return await _storage.delete(key: 'token');
  }
}

String _formatResponseLog(http.Response response, {Object? requestBody}) {
  final time = DateTime.now().toUtc().toIso8601String();

  JsonEncoder encoder = const JsonEncoder.withIndent(' ');
  String formattedRequestBody =
      requestBody != null ? encoder.convert(requestBody) : '';

  String formattedBodyJson;

  try {
    final json = jsonDecode(response.body);
    formattedBodyJson = encoder.convert(json);
  } catch (_) {
    formattedBodyJson = response.body;
  }

  return '''
          $time
          Request: ${response.request}${formattedRequestBody.isNotEmpty == true ? '\n  Request body: $formattedRequestBody' : ''}
          Response code: ${response.statusCode}
          Body: $formattedBodyJson
          ''';
}
