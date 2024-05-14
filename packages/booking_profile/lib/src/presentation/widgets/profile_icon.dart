import 'package:booking_profile/injection_container.dart';
import 'package:booking_profile/src/domain/usecases/wa_service.dart';
import 'package:flutter/material.dart';

class ProfileIcon extends StatelessWidget {
  final String imagePath;
  final String phoneNumber;
  final double size;
  final Color color;

  const ProfileIcon({
    super.key,
    required this.imagePath,
    required this.phoneNumber,
    this.size = 24.0,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    final WhatsAppService whatsappService = getIt<WhatsAppService>();
    return Row(
      children: <Widget>[
        InkWell(
          onTap: () {
            whatsappService.openWhatsAppWithMessage(phoneNumber, 'Hello from Flutter!');
          },
          child: CircleAvatar(
            backgroundColor: Colors.green[700],
            minRadius: 35.0,
            child: const Icon(
              Icons.call,
              size: 30.0,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.white70,
            minRadius: 60.0,
            child: CircleAvatar(
              radius: 50.0,
              backgroundImage: NetworkImage(imagePath),
            ),
          ),
        ),
        CircleAvatar(
          backgroundColor: Colors.green[700],
          minRadius: 35.0,
          child: const Icon(
            Icons.message,
            size: 30.0,
          ),
        ),
      ],
    );
  }
}
