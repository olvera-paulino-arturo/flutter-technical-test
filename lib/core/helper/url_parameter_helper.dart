
class UrlParameterHelper {
  static String mapper(String url, {List<String> parameters = const <String>[]}) {
    for (String element in parameters) {
      url = url.replaceFirst(RegExp(r'\{\w+\}'), element);
    }
    return url;
  }
}