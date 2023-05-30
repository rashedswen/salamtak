import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:salamtak/core/enums/enums.dart';
import 'package:salamtak/features/admin_feature/data/model/admin_medication_exchange_model.dart';
import 'package:salamtak/features/admin_feature/data/model/models.dart';

const String _medicationsRequestsCollection = 'requests';
const String _medicationsDonationsCollection = 'donations';

abstract class AdminRemoteDatasource {
  Future<List<AdminMedicationRequestModel>> getMedicationsRequests();

  Future<List<AdminMedicationDonationModel>> getMedicationsDontations();

  Future<List<AdminMedicationExchangeModel>> getMedicationsExchanges();

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

  Future<void> changeMedicationExchangeStatus(
    String id,
    MedicationStatus status,
    String? rejectedReason,
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

  // TODO : Complete exchange parts in repository and datasource
  @override
  Future<List<AdminMedicationExchangeModel>> getMedicationsExchanges() async {
    final snapshot =
        await _firestore.collection(_medicationsRequestsCollection).get();

    return snapshot.docs
        .map(
          (doc) => AdminMedicationExchangeModel.fromJson(
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

  @override
  Future<void> changeMedicationExchangeStatus(
    String id,
    MedicationStatus status,
    String? rejectedReason,
  ) async {
    await _firestore.collection(_medicationsRequestsCollection).doc(id).update({
      'status': status.englishName,
      'rejection_reason': rejectedReason,
      'updatedAt': DateTime.now().millisecondsSinceEpoch,
    });
  }
}
