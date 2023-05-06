import 'package:salamtak/core/enums/enums.dart';
import 'package:salamtak/features/medication_feature/data/model/models.dart';
import 'package:salamtak/features/medication_feature/domain/entity/entities.dart';
import 'package:salamtak/features/medication_feature/domain/entity/medication_donation.dart';
import 'package:salamtak/features/medication_feature/domain/entity/medication_request.dart';
import 'package:salamtak/features/user_feature/domain/entity/salamtak_user.dart';

abstract class MedicationRepository {
  // get Requests and Donations
  Future<List<MedicationRequestModel>> getMedicationsRequests();

  Future<List<MedicationDonationModel>> getMedicationsDontations();

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

  Future<void> acceptMedication({
    required String medicationId,
    required SalamtakUser user,
    required MedicationRequestType medicationRequestType,
  });

  Future<List<MedicationItem>> getUserHistory(
    String userId,
  );
}
