import '../services/xml/xml_service.dart';

Future<String> getUserId() async {
  return (await XMLService.readPref("user_id")).toString();
}
