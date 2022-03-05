import 'package:url_launcher/url_launcher.dart';

launchSignUpURL() async {
  const url = 'http://192.168.10.123/signup/';
  if (!await launch(url)) throw 'Could not launch $url';
}
