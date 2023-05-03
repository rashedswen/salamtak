import 'package:salamtak/core/enums/enums.dart';

abstract class AdminRepository {
  Future<void> changeRequestStatus(
    String id,
    MedicationStatus status,
  );

  Future<void> changeDonationStatus(
    String id,
    MedicationStatus status,
  );

  Future<void> deleteMedicationDonation(String id);

  Future<void> deleteMedicationRequest(String id);

  
}