class AppStrings {
  static String kBaseUrl = 'http://192.168.1.12:8000';
  static String kApiVersion = '/api';
  static String kHostUrl = kBaseUrl + kApiVersion + '/user';

  static String kRegisterUrl = kHostUrl + '/register';
  static String kCompleteProfileUrl = kHostUrl + '/complete_profile';
}
