import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'app/app.dart';
import 'bootstrap.dart';
import 'core/connection/platform/network_info_mobile.dart';
import 'core/connection/platform/network_info_web.dart';
import 'features/admin_feature/data/datasource/remote_datasource.dart';
import 'features/admin_feature/data/repository/admin_medication_repository.dart';
import 'features/medication_feature/data/data_source/remote_datasource.dart';
import 'features/medication_feature/data/repository/medication_repository_impl.dart';
import 'features/medication_feature/domain/repository/medication_repository.dart';
import 'features/user_feature/data/repository/authentication_repository_impl.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
    name: 'hello',
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
  final adminMedicationRepository = AdminMedicationRepositoryImpl(
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
