class MyApi {
  static const String urlApi = "https://reqres.in/api/users";
  static String nextPage(String page) {
    return "$urlApi?page=$page";
  }
}
