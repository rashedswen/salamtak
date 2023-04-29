import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:salamtak/features/medication_feature/data/model/medication_donation_model.dart';
import 'package:salamtak/features/medication_feature/data/model/medication_request_model.dart';
import 'package:salamtak/features/medication_feature/util/enums/enums.dart';

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
    final user = _firebaseAuth.currentUser;
    final medicationId = FirebaseFirestore.instance
        .collection(
          _medicationsRequestsCollection,
        )
        .doc();
    final medicationRequest = medication.copyWith(
      id: medicationId.id,
      userId: user!.uid,
      status: MedicationStatus.pending,
    );
    await medicationId.set(medicationRequest.toJson());
  }

  @override
  Future<void> addMedicationDonation(
    MedicationDonationModel medication,
  ) async {
    final user = _firebaseAuth.currentUser;
    final medicationId = FirebaseFirestore.instance
        .collection(
          _medicationsDonationsCollection,
        )
        .doc();
    final medicationRequest = medication.copyWith(
      id: medicationId.id,
      userId: user!.uid,
      status: MedicationStatus.pending,
    );
    await medicationId.set(medicationRequest.toJson());
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
    // final user = _firebaseAuth.currentUser;
    // final medications = await FirebaseFirestore.instance
    //     .collection(_medicationsDonationsCollection)
    //     .where('userId', isEqualTo: user!.uid)
    //     .get();
    // return medications.docs
    //     .map((medication) => MedicationRequestModel.fromJson(
    //           medication.data(),
    //         ))
    //     .toList();

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
}
