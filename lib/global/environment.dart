import 'dart:io';

class Environment {
  static Uri apiUrl(String path) {
    return Platform.isAndroid
        ? Uri(scheme: 'http', host: '10.0.2.2', port: 3000, path: '/api/$path')
        : Uri(
            scheme: 'http', host: 'localhost', port: 3000, path: '/api/$path');
  }

  static Uri socketHost = Platform.isAndroid
      ? Uri(scheme: 'http', host: '10.0.2.2', port: 3000, path: '/')
      : Uri(scheme: 'http', host: 'localhost', port: 3000, path: '/');
}
