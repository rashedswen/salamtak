import 'package:flutter/material.dart';

enum MedicationStatus {
  pending,
  approved,
  rejected,
  donated,
  received,
  expired,
  deleted
}

extension Status on MedicationStatus {
  String get arabicName {
    switch (this) {
      case MedicationStatus.pending:
        return 'قيد الانتظار';
      case MedicationStatus.approved:
        return 'تمت الموافقة';
      case MedicationStatus.rejected:
        return 'تم الرفض';
      case MedicationStatus.donated:
        return 'تم التبرع';
      case MedicationStatus.received:
        return 'تم الاستلام';
      case MedicationStatus.expired:
        return 'منتهي الصلاحية';
      case MedicationStatus.deleted:
        return 'تم الحذف';
    }
  }

  String get englishName {
    switch (this) {
      case MedicationStatus.pending:
        return 'Pending';
      case MedicationStatus.approved:
        return 'Approved';
      case MedicationStatus.rejected:
        return 'Rejected';
      case MedicationStatus.donated:
        return 'Donated';
      case MedicationStatus.received:
        return 'Received';
      case MedicationStatus.expired:
        return 'Expired';
      case MedicationStatus.deleted:
        return 'Deleted';
    }
  }

  Color get color {
    switch (this) {
      case MedicationStatus.pending:
        return Colors.orange;
      case MedicationStatus.approved:
        return Colors.green;
      case MedicationStatus.rejected:
        return Colors.red;
      case MedicationStatus.donated:
        return Colors.blue;
      case MedicationStatus.received:
        return Colors.purple;
      case MedicationStatus.expired:
        return Colors.grey;
      case MedicationStatus.deleted:
        return Colors.black;
    }
  }
}

extension StatusJson on String {
  MedicationStatus get toMedicineStatus {
    switch (toLowerCase()) {
      case 'pending':
        return MedicationStatus.pending;
      case 'approved':
        return MedicationStatus.approved;
      case 'rejected':
        return MedicationStatus.rejected;
      case 'donated':
        return MedicationStatus.donated;
      case 'received':
        return MedicationStatus.received;
      case 'expired':
        return MedicationStatus.expired;
      case 'deleted':
        return MedicationStatus.deleted;
      default:
        return MedicationStatus.pending;
    }
  }
}
