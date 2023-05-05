import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:salamtak/app/app.dart';
import 'package:salamtak/bootstrap.dart';
import 'package:salamtak/core/connection/network_info.dart';
import 'package:salamtak/core/connection/platform/network_info_mobile.dart';
import 'package:salamtak/features/admin_feature/data/datasource/remote_datasource.dart';
import 'package:salamtak/features/admin_feature/data/repository/admin_medication_repository.dart';
import 'package:salamtak/features/admin_feature/domain/repository/admin_medication_repository.dart';
import 'package:salamtak/features/medication_feature/data/data_source/remote_datasource.dart';
import 'package:salamtak/features/medication_feature/data/repository/medication_repository_impl.dart';
import 'package:salamtak/features/medication_feature/domain/repository/medication_repository.dart';
import 'package:salamtak/features/user_feature/data/repository/authentication_repository_impl.dart';
import 'package:salamtak/firebase_options.dart';

import 'package:salamtak/core/connection/platform/network_info_web.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
    // name: 'ssss',
  );

  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
  );

  final RemoteDatasource remoteDatasource = FirebaseDatasource();
  final networkInfo = !kIsWeb
      ? NetworkInfoImplMobile(InternetConnectionChecker.createInstance())
      : NetworkInfoImplWeb();

  final authenticationRepository = AuthenticationRepositoryImpl();
  await authenticationRepository.user.first;

  final MedicationRepository medicationRepository = MedicationRepoisitoryImpl(
    remoteDatasource: remoteDatasource,
    networkInfo: networkInfo,
  );
  final adminRemoteDatasource = FirebaseAdminDatasource();
  final AdminMedicationRepository adminMedicationRepository =
      AdminMedicationRepositoryImpl(
    remoteDataSource: adminRemoteDatasource,
  );
  await bootstrap(
    () => App(
      medicationRepository: medicationRepository,
      authenticationRepository: authenticationRepository,
      adminMedicationRepository: adminMedicationRepository,
    ),
  );
}
