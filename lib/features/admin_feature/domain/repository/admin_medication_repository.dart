import '../../../../core/enums/enums.dart';
import '../entity/entities.dart';

abstract class AdminMedicationRepository {
  Future<void> changeRequestStatus(
    String id,
    MedicationStatus status,
    String? rejectedReason,
  );

  Future<void> changeDonationStatus(
    String id,
    MedicationStatus status,
    String? rejectedReason,
  );
  
  Future<void> changeExchangeStatus(
    String id,
    MedicationStatus status,
    String? rejectedReason,
  );



  Future<List<AdminMedicationList>> getMedicationsRequestsAndDonations();
}
