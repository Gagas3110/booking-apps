import 'dart:developer';

import 'package:booking_profile/injection_container.dart';
import 'package:booking_profile/src/domain/usecases/message_service.dart';
import 'package:booking_profile/src/domain/usecases/wa_service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfileIcon extends StatelessWidget {
  final String imagePath;
  final String assetImageUrl;
  final String phoneNumber;
  final double size;
  final Color color;
  final double height = 120;
  const ProfileIcon(
      {super.key,
      required this.imagePath,
      required this.phoneNumber,
      this.size = 24.0,
      this.color = Colors.black,
      required this.assetImageUrl});

  @override
  Widget build(BuildContext context) {
    log(assetImageUrl);
    final WhatsAppService whatsappService = getIt<WhatsAppService>();
    final MessageService messageService = getIt<MessageService>();
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
            child: SizedBox(
                height: height,
                width: height,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(height / 2),
                  child: imagePath == 'http//'
                      ? Image.asset(assetImageUrl, fit: BoxFit.cover)
                      : CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: imagePath,
                          placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                          errorWidget: (context, url, error) => Container(
                            color: Colors.grey[300],
                            child: const Icon(
                              Icons.no_accounts,
                              color: Colors.red,
                            ),
                          ),
                        ),
                ))),
        InkWell(
          onTap: () {
            messageService.launchSMS(phoneNumber);
          },
          child: CircleAvatar(
            backgroundColor: Colors.green[700],
            minRadius: 35.0,
            child: const Icon(
              Icons.message,
              size: 30.0,
            ),
          ),
        ),
      ],
    );
  }
}
