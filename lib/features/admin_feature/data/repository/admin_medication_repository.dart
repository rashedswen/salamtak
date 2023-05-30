import 'package:salamtak/core/enums/medication_status.dart';
import 'package:salamtak/features/admin_feature/data/datasource/remote_datasource.dart';
import 'package:salamtak/features/admin_feature/domain/entity/entities.dart';
import 'package:salamtak/features/admin_feature/domain/repository/admin_medication_repository.dart';

class AdminMedicationRepositoryImpl extends AdminMedicationRepository {
  AdminMedicationRepositoryImpl({required this.remoteDataSource});

  final AdminRemoteDatasource remoteDataSource;
  @override
  Future<void> changeDonationStatus(
    String id,
    MedicationStatus status,
    String? rejectedReason,
  ) async {
    try {
      await remoteDataSource.changeMedicationDonationStatus(
        id,
        status,
        rejectedReason,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> changeRequestStatus(
    String id,
    MedicationStatus status,
    String? rejectedReason,
  ) async {
    try {
      await remoteDataSource.changeMedicationRequestStatus(
        id,
        status,
        rejectedReason,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<AdminMedicationList>> getMedicationsRequestsAndDonations() async {
    try {
      final requests = await remoteDataSource.getMedicationsRequests();
      final donations = await remoteDataSource.getMedicationsDontations();
      final medicationList = <AdminMedicationList>[
        ...donations.map((e) => e.toMedicationListItem()),
        ...requests.map((e) => e.toMedicationListItem()),
      ]..sort((a, b) => b.createdDate.compareTo(a.createdDate));
      return medicationList;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> changeExchangeStatus(
    String id,
    MedicationStatus status,
    String? rejectedReason,
  ) async {
    try {
      await remoteDataSource.changeMedicationExchangeStatus(
        id,
        status,
        rejectedReason,
      );
    } catch (e) {
      rethrow;
    }
  }
}
