import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chat {
  final String title;
  final String subtitle;
  final bool isRead;
  final IconData? groupIcon;
  final String? imageUrl;
  final DateTime timeStamp;

  Chat({
    required this.title,
    required this.subtitle,
    this.isRead = false,
    this.groupIcon,
    this.imageUrl,
    required this.timeStamp,
  });
  String get formattedDate {
    final now = DateTime.now();
    final yesterday = now.subtract(const Duration(days: 1));
    final difference = now.difference(timeStamp).inDays;
    if (difference == 0) {
      return DateFormat.jm().format(timeStamp);
    } else if (difference == 1 &&
        timeStamp.day == yesterday.day &&
        timeStamp.month == yesterday.month &&
        timeStamp.year == yesterday.year) {
      return 'Yesterday';
    } else {
      return DateFormat.yMd().format(timeStamp);
    }
  }
}
