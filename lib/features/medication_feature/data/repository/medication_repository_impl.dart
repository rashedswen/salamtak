import 'package:salamtak/core/connection/network_info.dart';
import 'package:salamtak/features/medication_feature/data/data_source/remote_datasource.dart';
import 'package:salamtak/features/medication_feature/data/model/medication_donation_model.dart';
import 'package:salamtak/features/medication_feature/data/model/medication_request_model.dart';
import 'package:salamtak/features/medication_feature/domain/entity/medication_donation.dart';
import 'package:salamtak/features/medication_feature/domain/entity/medication_request.dart';
import 'package:salamtak/features/medication_feature/domain/repository/medication_repository.dart';
import 'package:salamtak/core/enums/enums.dart';

class MedicationRepoisitoryImpl extends MedicationRepository {
  MedicationRepoisitoryImpl({
    required this.networkInfo,
    required this.remoteDatasource,
  });

  final NetworkInfo networkInfo;
  final RemoteDatasource remoteDatasource;

  @override
  Future<void> addMedicationDonation(MedicationDonation medication) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDatasource.addMedicationDonation(medication.toModel());
      } catch (e) {
        print(e);
        rethrow;
      }
    } else {
      throw Exception();
    }
  }

  @override
  Future<void> addMedicationRequest(MedicationRequest medication) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDatasource.addMedicationRequest(medication.toModel());
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
}
