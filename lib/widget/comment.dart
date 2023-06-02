import 'package:flutter/material.dart';
import 'package:instagram/widget/rounded_avatar.dart';

import '../constants/common_size.dart';

class Comment extends StatelessWidget {
  final bool showImage;
  final String username;
  final String? text;
  final DateTime? dateTime;

  Comment({
    super.key,
    this.showImage = true,
    required this.username,
    this.text,
    this.dateTime,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (showImage)
          const RoundedAvatar(
            size: 24.0,
          ),
        if (showImage)
          const SizedBox(
            width: common_xxs_gap,
          ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: username,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black87),
                  ),
                  const TextSpan(text: '   '),
                  TextSpan(
                    text: text,
                    style: const TextStyle(color: Colors.black87),
                  )
                ],
              ),
            ),
            if (dateTime != null)
              Text(
                dateTime.toString(),
                style: TextStyle(color: Colors.grey.shade400, fontSize: 10),
              )
          ],
        ),
      ],
    );
  }
}
