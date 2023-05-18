import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/connection/network_info.dart';
import '../../../../core/enums/enums.dart';
import '../data_source/remote_datasource.dart';
import '../model/models.dart';
import '../../domain/entity/medication_donation.dart';
import '../../domain/entity/medication_list.dart';
import '../../domain/entity/medication_request.dart';
import '../../domain/entity/users_accepted_requests.dart';
import '../../domain/repository/medication_repository.dart';
import '../../../user_feature/domain/entity/salamtak_user.dart';

class MedicationRepoisitoryImpl extends MedicationRepository {
  MedicationRepoisitoryImpl({
    required this.networkInfo,
    required this.remoteDatasource,
  });

  final NetworkInfo networkInfo;
  final RemoteDatasource remoteDatasource;

  @override
  Future<void> addMedicationDonation(
    MedicationDonation medication,
    PlatformFile? image,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDatasource.addMedicationDonation(
          medication.toModel(),
          image,
        );
      } catch (e) {
        print(e);
        rethrow;
      }
    } else {
      throw Exception();
    }
  }

  @override
  Future<void> addMedicationRequest(
    MedicationRequest medication,
    PlatformFile? image,
    PlatformFile? prescription,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDatasource.addMedicationRequest(
          medication.toModel(),
          image,
          prescription,
        );
      } on Exception {
        rethrow;
      }
    } else {
      throw Exception();
    }
  }

  @override
  Future<void> deleteMedication(
    String id,
    MedicationRequestType medicationRequestType,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        if (medicationRequestType == MedicationRequestType.donation) {
          await remoteDatasource.deleteMedicationDonation(id);
        } else {
          await remoteDatasource.deleteMedicationRequest(id);
        }
      } on Exception {
        rethrow;
      }
    }
  }

  @override
  Future<MedicationDonation> getMedicationDonation(String id) async {
    if (await networkInfo.isConnected) {
      try {
        final medicationDonationModel =
            await remoteDatasource.getMedicationDonation(id);
        return medicationDonationModel.toEntity();
      } on Exception {
        rethrow;
      }
    } else {
      throw Exception();
    }
  }

  @override
  Future<MedicationRequest> getMedicationRequest(String id) async {
    if (await networkInfo.isConnected) {
      try {
        final medicationRequestModel =
            await remoteDatasource.getMedicationRequest(id);
        return medicationRequestModel.toEntity();
      } on Exception {
        rethrow;
      }
    } else {
      throw Exception();
    }
  }

  @override
  Future<List<MedicationDonationModel>> getMedicationsDontations() async {
    if (await networkInfo.isConnected) {
      try {
        final medicationDonationsModel =
            await remoteDatasource.getMedicationsDontations();
        return medicationDonationsModel;
      } on Exception {
        rethrow;
      }
    } else {
      throw Exception();
    }
  }

  @override
  Future<List<MedicationRequestModel>> getMedicationsRequests() async {
    if (await networkInfo.isConnected) {
      try {
        final medicationRequestsModel =
            await remoteDatasource.getMedicationsRequests();
        return medicationRequestsModel;
      } on Exception {
        rethrow;
      }
    } else {
      throw Exception();
    }
  }

  @override
  Future<void> updateMedicationDonation(MedicationDonation medication) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDatasource.updateMedicationDonation(medication.toModel());
      } on Exception {
        rethrow;
      }
    } else {
      throw Exception();
    }
  }

  @override
  Future<void> updateMedicationRequest(MedicationRequest medication) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDatasource.updateMedicationRequest(medication.toModel());
      } on Exception {
        rethrow;
      }
    } else {
      throw Exception();
    }
  }

  @override
  Future<void> acceptMedication({
    required String medicationId,
    required SalamtakUser user,
    required MedicationRequestType medicationRequestType,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        if(FirebaseAuth.instance.currentUser == null) {
          throw Exception('must be logged in to accept a medication request/donation');
        }
        if (medicationRequestType == MedicationRequestType.donation) {
          await remoteDatasource.acceptMedicationDonation(
            medicationId,
            user.toModel(),
          );
        } else {
          await remoteDatasource.acceptMedicationRequest(
            medicationId,
            user.toModel(),
          );
        }
      } on Exception {
        rethrow;
      }
    }
  }

  @override
  Future<List<MedicationItem>> getUserHistory(
    String userId,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final medicationRequestsModel =
            await remoteDatasource.getUserMedicationRequests(userId);
        final medicationDonationsModel =
            await remoteDatasource.getUserMedicationDonations(userId);

        final listOfMedication = <MedicationItem>[];
        final mappedDonations =
            medicationDonationsModel.map((e) => e.toMedicationListItem());
        final mappedRequest =
            medicationRequestsModel.map((e) => e.toMedicationListItem());

        listOfMedication
          ..addAll(mappedDonations)
          ..addAll(mappedRequest);

        return listOfMedication;
      } on Exception {
        rethrow;
      }
    } else {
      throw Exception();
    }
  }

  @override
  Future<List<UsersAcceptedRequests>> getUsersDonatingAndRequestingMedication(
    String medicationId,
    MedicationRequestType requestType,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final list =
            await remoteDatasource.getUsersDonatingAndRequestingMedication(
          medicationId,
          requestType,
        );
        return list.map((e) => e.toEntity()).toList();
      } on Exception {
        rethrow;
      }
    } else {
      throw Exception();
    }
  }
}
