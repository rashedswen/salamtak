import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:salamtak/app/app.dart';
import 'package:salamtak/bootstrap.dart';
import 'package:salamtak/core/connection/network_info.dart';
import 'package:salamtak/features/medication_feature/data/data_source/remote_datasource.dart';
import 'package:salamtak/features/medication_feature/data/repository/medication_repository_impl.dart';
import 'package:salamtak/features/medication_feature/domain/repository/medication_repository.dart';
import 'package:salamtak/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
    name: 'hello',
  );

  final RemoteDatasource remoteDatasource = FirebaseDatasource();
  final NetworkInfo networkInfo =
      NetworkInfoImpl(InternetConnectionChecker.createInstance());

  final MedicationRepository medicationRepository = MedicationRepoisitoryImpl(
    remoteDatasource: remoteDatasource,
    networkInfo: networkInfo,
  );
  await bootstrap(
    () => App(
      medicationRepository: medicationRepository,
    ),
  );
}