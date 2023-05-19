import 'package:flutter/material.dart';

enum EmergencyLevel {
  low,
  medium,
  high,
  critical,
  unknown,
}

extension EmergencyLevelX on EmergencyLevel {
  String get englishName {
    switch (this) {
      case EmergencyLevel.low:
        return 'Low';
      case EmergencyLevel.medium:
        return 'Medium';
      case EmergencyLevel.high:
        return 'High';
      case EmergencyLevel.critical:
        return 'Critical';
      case EmergencyLevel.unknown:
        return 'Unknown';
    }
  }

  String get arabicName {
    switch (this) {
      case EmergencyLevel.low:
        return 'منخفض';
      case EmergencyLevel.medium:
        return 'متوسط';
      case EmergencyLevel.high:
        return 'عالي';
      case EmergencyLevel.critical:
        return 'حرج';
      case EmergencyLevel.unknown:
        return 'غير معروف';
    }
  }

  Color get color {
    switch (this) {
      case EmergencyLevel.low:
        return Colors.green.shade200;
      case EmergencyLevel.medium:
        return const Color(0xFF095D7E);
      case EmergencyLevel.high:
        return Colors.orange;
      case EmergencyLevel.critical:
        return Colors.red;
      case EmergencyLevel.unknown:
        return Colors.grey;
    }
  }
}

extension EmgLVL on String {
  EmergencyLevel get toEmergencyLevel {
    switch (toLowerCase()) {
      case 'low':
        return EmergencyLevel.low;
      case 'medium':
        return EmergencyLevel.medium;
      case 'high':
        return EmergencyLevel.high;
      case 'critical':
        return EmergencyLevel.critical;
      case 'unknown':
        return EmergencyLevel.unknown;
      default:
        return EmergencyLevel.unknown;
    }
  }
}
