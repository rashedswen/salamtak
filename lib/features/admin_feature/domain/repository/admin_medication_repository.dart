import 'package:salamtak/core/enums/enums.dart';
import 'package:salamtak/features/admin_feature/domain/entity/entities.dart';

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

  Future<List<AdminMedicationList>> getMedicationsRequestsAndDonations();
}
