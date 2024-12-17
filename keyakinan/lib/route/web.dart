import 'package:vania/vania.dart';

String translate(String key, Map<String, String> params) {
  // Simple translation logic (you can expand this as needed)
  String translation = key; // Default to the key itself
  if (key == 'welcome') {
    translation = 'Welcome, ${params['name']}!';
  }
  return translation;
}

class WebRoute implements Route {
  @override
  void register() {
    Router.get("/", () {
      return Response.html(translate('welcome', {'name': 'Vania'}));
    });
  }
}