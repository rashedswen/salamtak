import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum MedicineForm {
  tablet,
  capsule,
  syrup,
  injection,
  ointment,
  drops,
  inhaler,
  other
}

extension MedForm on MedicineForm {
  String get arabicName {
    switch (this) {
      case MedicineForm.tablet:
        return 'أقراص';
      case MedicineForm.capsule:
        return 'كبسولات';
      case MedicineForm.syrup:
        return 'شراب';
      case MedicineForm.injection:
        return 'حقن';
      case MedicineForm.ointment:
        return 'مرهم';
      case MedicineForm.drops:
        return 'قطرات';
      case MedicineForm.inhaler:
        return 'بخاخ';
      case MedicineForm.other:
        return 'أخرى';
    }
  }

  String get englishName {
    switch (this) {
      case MedicineForm.tablet:
        return 'Tablet';
      case MedicineForm.capsule:
        return 'Capsule';
      case MedicineForm.syrup:
        return 'Syrup';
      case MedicineForm.injection:
        return 'Injection';
      case MedicineForm.ointment:
        return 'Ointment';
      case MedicineForm.drops:
        return 'Drops';
      case MedicineForm.inhaler:
        return 'Inhaler';
      case MedicineForm.other:
        return 'Other';
    }
  }

  IconData get icon {
    switch (this) {
      case MedicineForm.tablet:
        return Icons.tablet;
      case MedicineForm.capsule:
        return FontAwesomeIcons.capsules;
      case MedicineForm.syrup:
        return FontAwesomeIcons.bottleDroplet;
      case MedicineForm.injection:
        return Icons.local_hospital;
      case MedicineForm.ointment:
        return Icons.local_hospital;
      case MedicineForm.drops:
        return Icons.local_hospital;
      case MedicineForm.inhaler:
        return Icons.local_hospital;
      case MedicineForm.other:
        return Icons.local_hospital;
    }
  }
}

MedicineForm getMedicineForm(String name) {
  switch (name) {
    case 'tablet':
      return MedicineForm.tablet;
    case 'capsule':
      return MedicineForm.capsule;
    case 'syrup':
      return MedicineForm.syrup;
    case 'injection':
      return MedicineForm.injection;
    case 'ointment':
      return MedicineForm.ointment;
    case 'drops':
      return MedicineForm.drops;
    case 'inhaler':
      return MedicineForm.inhaler;
    case 'other':
      return MedicineForm.other;
    default:
      return MedicineForm.other;
  }
}

extension MedFormJson on String {
  MedicineForm get toMedicineForm {
    switch (this) {
      case 'tablet':
        return MedicineForm.tablet;
      case 'capsule':
        return MedicineForm.capsule;
      case 'syrup':
        return MedicineForm.syrup;
      case 'injection':
        return MedicineForm.injection;
      case 'ointment':
        return MedicineForm.ointment;
      case 'drops':
        return MedicineForm.drops;
      case 'inhaler':
        return MedicineForm.inhaler;
      case 'other':
        return MedicineForm.other;
      default:
        return MedicineForm.other;
    }
  }
}
