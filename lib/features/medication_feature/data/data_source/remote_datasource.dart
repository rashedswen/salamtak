import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:salamtak/core/enums/enums.dart';
import 'package:salamtak/features/medication_feature/data/model/models.dart';
import 'package:salamtak/features/user_feature/data/model/salamtak_user_model.dart';

const String _medicationsRequestsCollection = 'requests';
const String _medicationsDonationsCollection = 'donations';

abstract class RemoteDatasource {
  Future<List<MedicationRequestModel>> getMedicationsRequests();

  Future<List<MedicationDonationModel>> getMedicationsDontations();

  Future<MedicationRequestModel> getMedicationRequest(
    String id,
  );

  Future<MedicationDonationModel> getMedicationDonation(
    String id,
  );

  Future<void> addMedicationRequest(
    MedicationRequestModel medication,
  );

  Future<void> addMedicationDonation(
    MedicationDonationModel medication,
  );

  Future<void> updateMedicationRequest(
    MedicationRequestModel medication,
  );

  Future<void> updateMedicationDonation(
    MedicationDonationModel medication,
  );

  Future<void> deleteMedicationDonation(String id);

  Future<void> deleteMedicationRequest(String id);

  Future<void> changeMedicationRequestStatus(
    String id,
    MedicationStatus status,
  );

  Future<void> changeMedicationDonationStatus(
    String id,
    MedicationStatus status,
  );

  Future<void> acceptMedicationRequest(
    String medicationId,
    SalamtakUserModel user,
  );

  Future<void> acceptMedicationDonation(
    String medicationId,
    SalamtakUserModel user,
  );

  Future<List<MedicationDonationModel>> getUserMedicationDonations(
    String userId,
  );

  Future<List<MedicationRequestModel>> getUserMedicationRequests(
    String userId,
  );
}

class FirebaseDatasource extends RemoteDatasource {
  FirebaseDatasource({
    firebase_auth.FirebaseAuth? firebaseAuth,
  }) : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance;

  final firebase_auth.FirebaseAuth _firebaseAuth;

  @override
  Future<void> addMedicationRequest(
    MedicationRequestModel medication,
  ) async {
    String? imgUrl;
    String? prescriptionUrl;
    if (medication.prescription != null) {
      imgUrl = await uploadImageToFirebase(
        medication.image ?? '',
        'requests',
      );
      prescriptionUrl = await uploadImageToFirebase(
        medication.prescription ?? '',
        'prescriptions',
      );
    }

    final medicationId = FirebaseFirestore.instance
        .collection(
          _medicationsRequestsCollection,
        )
        .doc();
    final medicationRequest = medication.copyWith(
      id: medicationId.id,
      status: MedicationStatus.pending,
      image: imgUrl,
      prescription: prescriptionUrl,
    );
    await medicationId.set(medicationRequest.toJson());
  }

  @override
  Future<void> addMedicationDonation(
    MedicationDonationModel medication,
  ) async {
    String? imgUrl;
    if (medication.image != null) {
      imgUrl = await uploadImageToFirebase(medication.image ?? '', 'donations');
    }
    // final user = _firebaseAuth.currentUser;
    final medicationId = FirebaseFirestore.instance
        .collection(
          _medicationsDonationsCollection,
        )
        .doc();
    final medicationRequest = medication.copyWith(
      id: medicationId.id,
      // userId: user!.uid,
      status: MedicationStatus.pending,
      image: imgUrl,
    );
    await medicationId.set(medicationRequest.toJson());
  }

  Future<String?> uploadImageToFirebase(
    String imgaePath,
    String folderName,
  ) async {
    final name = imgaePath.split('/').last;
    final path = '$folderName/$name';
    final prescription = File(imgaePath);

    final ref = firebase_storage.FirebaseStorage.instance.ref().child(path);
    final uploadTask = ref.putFile(prescription);

    final p = await uploadTask.whenComplete(() => null);

    return p.ref.getDownloadURL();
  }

  @override
  Future<void> changeMedicationRequestStatus(
    String id,
    MedicationStatus status,
  ) async {
    await FirebaseFirestore.instance
        .collection(_medicationsRequestsCollection)
        .doc(id)
        .update({'status': status.toString()});
  }

  @override
  Future<void> changeMedicationDonationStatus(
    String id,
    MedicationStatus status,
  ) async {
    await FirebaseFirestore.instance
        .collection(_medicationsDonationsCollection)
        .doc(id)
        .update({'status': status.toString()});
  }

  @override
  Future<MedicationRequestModel> getMedicationRequest(String id) async {
    final medication = await FirebaseFirestore.instance
        .collection(_medicationsRequestsCollection)
        .doc(id)
        .get();

    return MedicationRequestModel.fromJson(medication.data()!);
  }

  @override
  Future<List<MedicationDonationModel>> getMedicationsDontations() async {
    final medications = await FirebaseFirestore.instance
        .collection(_medicationsDonationsCollection)
        .get();

    return medications.docs
        .map(
          (medication) => MedicationDonationModel.fromJson(
            medication.data(),
          ),
        )
        .toList();
  }

  @override
  Future<List<MedicationRequestModel>> getMedicationsRequests() async {
    final medications = await FirebaseFirestore.instance
        .collection(_medicationsRequestsCollection)
        .get();

    return medications.docs
        .map(
          (medication) => MedicationRequestModel.fromJson(
            medication.data(),
          ),
        )
        .toList();
  }

  @override
  Future<void> updateMedicationDonation(
    MedicationDonationModel medication,
  ) async {
    final medicationId = FirebaseFirestore.instance
        .collection(
          _medicationsDonationsCollection,
        )
        .doc(medication.id);

    await medicationId.update(medication.toJson());
  }

  @override
  Future<void> deleteMedicationRequest(String id) async {
    await FirebaseFirestore.instance
        .collection(_medicationsRequestsCollection)
        .doc(id)
        .delete();
  }

  @override
  Future<void> deleteMedicationDonation(String id) async {
    await FirebaseFirestore.instance
        .collection(_medicationsDonationsCollection)
        .doc(id)
        .delete();
  }

  @override
  Future<MedicationDonationModel> getMedicationDonation(String id) async {
    final medication = await FirebaseFirestore.instance
        .collection(_medicationsDonationsCollection)
        .doc(id)
        .get();

    return MedicationDonationModel.fromJson(medication.data()!);
  }

  @override
  Future<void> updateMedicationRequest(
    MedicationRequestModel medication,
  ) async {
    final medicationId = FirebaseFirestore.instance
        .collection(_medicationsDonationsCollection)
        .doc(medication.id);

    await medicationId.update(medication.toJson());
  }

  @override
  Future<void> acceptMedicationDonation(
    String medicationId,
    SalamtakUserModel user,
  ) async {
    final donate = FirebaseFirestore.instance
        .collection(_medicationsDonationsCollection)
        .doc(medicationId)
        .collection('users')
        .doc(user.id);

    final s = await donate.set(user.toJson());

    print('s.toString()');
  }

  @override
  Future<void> acceptMedicationRequest(
    String medicationId,
    SalamtakUserModel user,
  ) async {
    final request = FirebaseFirestore.instance
        .collection(_medicationsRequestsCollection)
        .doc(medicationId)
        .collection('users')
        .doc(user.id);

    await request.set(user.toJson());
  }

  @override
  Future<List<MedicationDonationModel>> getUserMedicationDonations(
    String userId,
  ) async {
    final medications = await FirebaseFirestore.instance
        .collection(_medicationsDonationsCollection)
        .where('userId', isEqualTo: userId)
        .get();

    return medications.docs
        .map(
          (medication) => MedicationDonationModel.fromJson(
            medication.data(),
          ),
        )
        .toList();
  }

  @override
  Future<List<MedicationRequestModel>> getUserMedicationRequests(
    String userId,
  ) async {
    final medications = await FirebaseFirestore.instance
        .collection(_medicationsRequestsCollection)
        .where('userId', isEqualTo: userId)
        .get();

    return medications.docs
        .map(
          (medication) => MedicationRequestModel.fromJson(
            medication.data(),
          ),
        )
        .toList();
  }
}
