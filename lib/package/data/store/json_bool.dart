enum JsonBool{
  Y, N
}

extension JsonBoolExtension on JsonBool {
  String toJson() => name;

  static JsonBool fromJson(String json) {
    switch (json) {
      case "Y":
        return JsonBool.Y;
      case "N":
        return JsonBool.N;
      default:
        return JsonBool.Y;
    }
  }
}