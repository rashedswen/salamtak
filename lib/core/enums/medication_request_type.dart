enum  MedicationRequestType {
  request,
  donation,
  sell,
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
    }
  }
}

extension MedReqType on String {
  MedicationRequestType get toMedicationRequestType {
    switch (this) {
      case 'طلب':
        return MedicationRequestType.request;
      case 'تبرع':
        return MedicationRequestType.donation;
      case 'بيع':
        return MedicationRequestType.sell;
      default:
        return MedicationRequestType.request;
    }
  }
}
