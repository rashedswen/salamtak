import 'package:file_picker/file_picker.dart';
import 'package:salamtak/core/enums/enums.dart';
import 'package:salamtak/features/medication_feature/data/model/medication_exchange_model.dart';
import 'package:salamtak/features/medication_feature/data/model/models.dart';
import 'package:salamtak/features/medication_feature/domain/entity/entities.dart';
import 'package:salamtak/features/medication_feature/domain/entity/medication_donation.dart';
import 'package:salamtak/features/medication_feature/domain/entity/medication_exchange.dart';
import 'package:salamtak/features/medication_feature/domain/entity/medication_request.dart';
import 'package:salamtak/features/medication_feature/domain/entity/users_accepted_requests.dart';
import 'package:salamtak/features/user_feature/domain/entity/salamtak_user.dart';

abstract class MedicationRepository {
  // get Requests and Donations
  Future<List<MedicationRequestModel>> getMedicationsRequests();

  Future<List<MedicationDonationModel>> getMedicationsDontations();

  Future<List<MedicationExchange>> getMedicationsExchanges();

  Future<MedicationRequest> getMedicationRequest(String id);

  Future<MedicationDonation> getMedicationDonation(String id);

  Future<MedicationExchange> getMedicationExchange(String id);

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

  Future<void> addMedicationExchange(
    MedicationExchange medication,
    PlatformFile? medicationImage,
    PlatformFile? exchangeMedicationImage,
  );

  // update
  Future<void> updateMedicationRequest(MedicationRequest medication);

  Future<void> updateMedicationDonation(MedicationDonation medication);

  Future<void> updateMedicationExchange(MedicationExchange medication);

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
