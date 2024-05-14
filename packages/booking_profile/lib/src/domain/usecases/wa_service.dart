import 'package:url_launcher/url_launcher.dart';

class WhatsAppService {
  Future<void> openWhatsAppWithMessage(String phoneNumber, String message) async {
    final whatsappUrl = "https://wa.me/$phoneNumber?text=${Uri.parse(message)}";
    if (await canLaunchUrl(Uri.parse(whatsappUrl))) {
      await launchUrl(Uri.parse(whatsappUrl));
    } else {
      throw 'Could not launch $whatsappUrl';
    }
  }
}
