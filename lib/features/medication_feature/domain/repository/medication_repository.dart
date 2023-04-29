import 'package:salamtak/features/medication_feature/domain/entity/medication_donation.dart';
import 'package:salamtak/features/medication_feature/domain/entity/medication_request.dart';
import 'package:salamtak/features/medication_feature/util/enums/enums.dart';

abstract class MedicationRepository {
  // get Requests and Donations
  Future<List<MedicationRequest>> getMedicationsRequests();

  Future<List<MedicationDonation>> getMedicationsDontations();

  Future<MedicationRequest> getMedicationRequest(String id);

  Future<MedicationDonation> getMedicationDonation(String id);

  // add
  Future<void> addMedicationRequest(MedicationRequest medication);

  Future<void> addMedicationDonation(MedicationDonation medication);

  // update
  Future<void> updateMedicationRequest(MedicationRequest medication);

  Future<void> updateMedicationDonation(MedicationDonation medication);

  // delete
  Future<void> deleteMedication(
    String id,
    MedicationRequestType medicationRequestType,
  );
}
