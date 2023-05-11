import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../core/enums/enums.dart';
import '../model/models.dart';

const String _medicationsRequestsCollection = 'requests';
const String _medicationsDonationsCollection = 'donations';

abstract class AdminRemoteDatasource {
  Future<List<AdminMedicationRequestModel>> getMedicationsRequests();

  Future<List<AdminMedicationDonationModel>> getMedicationsDontations();

  Future<void> changeMedicationRequestStatus(
    String id,
    MedicationStatus status,
    String? rejectionReason,
  );

  Future<void> changeMedicationDonationStatus(
    String id,
    MedicationStatus status,
    String? rejectionReason,
  );
}

class FirebaseAdminDatasource implements AdminRemoteDatasource {
  FirebaseAdminDatasource({
    FirebaseFirestore? firestore,
  }) : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  @override
  Future<void> changeMedicationDonationStatus(
    String id,
    MedicationStatus status,
    String? rejectionReason,
  ) async {
    await _firestore
        .collection(_medicationsDonationsCollection)
        .doc(id)
        .update({
      'status': status.englishName,
      'rejection_reason': rejectionReason,
      'updatedAt': DateTime.now().millisecondsSinceEpoch,
    });

    log('message');
  }

  @override
  Future<void> changeMedicationRequestStatus(
    String id,
    MedicationStatus status,
    String? rejectionReason,
  ) async {
    await _firestore.collection(_medicationsRequestsCollection).doc(id).update({
      'status': status.englishName,
      'rejection_reason': rejectionReason,
      'updatedAt': DateTime.now().millisecondsSinceEpoch,
    });
  }

  @override
  Future<List<AdminMedicationDonationModel>> getMedicationsDontations() async {
    final snapshot =
        await _firestore.collection(_medicationsDonationsCollection).get();

    return snapshot.docs
        .map(
          (doc) => AdminMedicationDonationModel.fromJson(
            doc.data(),
          ),
        )
        .toList();
  }

  @override
  Future<List<AdminMedicationRequestModel>> getMedicationsRequests() async {
    final snapshot =
        await _firestore.collection(_medicationsRequestsCollection).get();

    return snapshot.docs
        .map(
          (doc) => AdminMedicationRequestModel.fromJson(
            doc.data(),
          ),
        )
        .toList();
  }
}
