import 'package:exaroton_api/exaroton_api.dart';

class Globals {
  static ExarotonClient exarotonClient = ExarotonClient("");

  static void setExarotonClient(String api) {
    exarotonClient = ExarotonClient(api);
  }
}