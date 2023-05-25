import 'package:flutter/material.dart';
import 'package:salamtak/util/constants.dart';

enum MedicationRequestType {
  request,
  donation,
  sell,
  exchange,
}

extension TypeMed on MedicationRequestType {
  String get arabicName {
    switch (this) {
      case MedicationRequestType.request:
        return 'طلب';
      case MedicationRequestType.donation:
        return 'تبرع';
      case MedicationRequestType.sell:
        return 'بيع';
      case MedicationRequestType.exchange:
        return 'تبادل';
    }
  }

  String get englishName {
    switch (this) {
      case MedicationRequestType.request:
        return 'Request';
      case MedicationRequestType.donation:
        return 'Donation';
      case MedicationRequestType.sell:
        return 'Sell';
      case MedicationRequestType.exchange:
        return 'Exchange';
    }
  }

  Color get color {
    switch (this) {
      case MedicationRequestType.request:
        return darkGreen;
      case MedicationRequestType.donation:
        return lightGreen;
      case MedicationRequestType.sell:
        return Colors.blueAccent;
      case MedicationRequestType.exchange:
        return Colors.blueAccent;
    }
  }
}

extension MedReqType on String {
  MedicationRequestType get toMedicationRequestType {
    switch (toLowerCase()) {
      case 'طلب':
      case 'request':
        return MedicationRequestType.request;
      case 'تبرع':
      case 'donation':
        return MedicationRequestType.donation;
      case 'بيع':
      case 'sell':
        return MedicationRequestType.sell;
      case 'تبادل':
      case 'exchange':
        return MedicationRequestType.exchange;
      default:
        return MedicationRequestType.request;
    }
  }
}
