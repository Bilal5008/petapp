import 'package:petapp/networking/environment.dart';

class AppConfig {

  AppConfig._privateConstructor();

  static final AppConfig _instance = AppConfig._privateConstructor();

  static AppConfig get instance => _instance;

  static const String _baseUrl = 'baseUrl';

  late Map<String, dynamic> _config;

  void setEnvironment(Environment env) {
    switch (env) {
      case Environment.dev:
        _config = devConstants;
        break;
      case Environment.stage:
        _config = stageConstants;
        break;
      case Environment.prod:
        _config = prodConstants;
        break;
    }
  }

  dynamic get apiBaseUrl {
    return _config[_baseUrl];
  }

  Map<String, dynamic> devConstants = {
    _baseUrl: "https://api.themoviedb.org/3",
  };

  Map<String, dynamic> stageConstants = {
    _baseUrl: "https://api.themoviedb.org/3",
  };

  Map<String, dynamic> prodConstants = {
    _baseUrl: "https://api.themoviedb.org/3",
  };
}
