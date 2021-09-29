class GlobalApiService {
  //One instance, needs factory

  GlobalApiService._privateConstructor();

  static final GlobalApiService _instance =
      GlobalApiService._privateConstructor();

  factory GlobalApiService() {
    return _instance;
  }

  String getBaseUrl() {
    return 'https://api.themoviedb.org/3/';
  }
}
