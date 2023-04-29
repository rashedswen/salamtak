enum EmergencyLevel {
  low,
  medium,
  normal,
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
      case EmergencyLevel.normal:
        return 'Normal';
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
      case EmergencyLevel.normal:
        return 'عادي';
      case EmergencyLevel.high:
        return 'عالي';
      case EmergencyLevel.critical:
        return 'حرج';
      case EmergencyLevel.unknown:
        return 'غير معروف';
    }
  }

  String get color {
    switch (this) {
      case EmergencyLevel.low:
        return '#00FF00';
      case EmergencyLevel.medium:
        return '#00FF00';
      case EmergencyLevel.normal:
        return '#00FF00';
      case EmergencyLevel.high:
        return '#00FF00';
      case EmergencyLevel.critical:
        return '#00FF00';
      case EmergencyLevel.unknown:
        return '#00FF00';
    }
  }
}

extension EmgLVL on String {
  EmergencyLevel get toEmergencyLevel {
    switch (this) {
      case 'Low':
        return EmergencyLevel.low;
      case 'Medium':
        return EmergencyLevel.medium;
      case 'Normal':
        return EmergencyLevel.normal;
      case 'High':
        return EmergencyLevel.high;
      case 'Critical':
        return EmergencyLevel.critical;
      case 'Unknown':
        return EmergencyLevel.unknown;
      default:
        return EmergencyLevel.unknown;
    }
  }
}