import 'package:url_launcher/url_launcher.dart';
Future<void> launchUPIIntent(String upiUrl) async {
  if (await canLaunchUrl(Uri.parse(upiUrl))) {
    await launchUrl(Uri.parse(upiUrl));
  }
}
