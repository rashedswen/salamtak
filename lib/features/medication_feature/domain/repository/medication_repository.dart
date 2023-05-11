import 'package:file_picker/file_picker.dart';
import '../../../../core/enums/enums.dart';
import '../../data/model/models.dart';
import '../entity/entities.dart';
import '../entity/medication_donation.dart';
import '../entity/medication_request.dart';
import '../entity/users_accepted_requests.dart';
import '../../../user_feature/domain/entity/salamtak_user.dart';

abstract class MedicationRepository {
  // get Requests and Donations
  Future<List<MedicationRequestModel>> getMedicationsRequests();

  Future<List<MedicationDonationModel>> getMedicationsDontations();

  Future<MedicationRequest> getMedicationRequest(String id);

  Future<MedicationDonation> getMedicationDonation(String id);

  // add
  Future<void> addMedicationRequest(
    MedicationRequest medication,
    PlatformFile? image,
    PlatformFile? prescription,
  );

  Future<void> addMedicationDonation(
    MedicationDonation medication,
    PlatformFile? image,
  );

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

  Future<List<UsersAcceptedRequests>> getUsersDonatingAndRequestingMedication(
    String medicationId,
    MedicationRequestType requestType,
  );
}
