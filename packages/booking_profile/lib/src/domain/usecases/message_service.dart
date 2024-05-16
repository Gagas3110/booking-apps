import 'package:url_launcher/url_launcher.dart';

class MessageService {
  void launchSMS(String phoneNumber) async {
    const uri = 'sms:phoneNumber?body=Hello%20there!';
    if (await canLaunchUrl(Uri.parse(uri))) {
      await launchUrl(Uri.parse(uri));
    } else {
      throw 'Could not launch $uri';
    }
  }
}
