import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../domain/entity/entities.dart';
import '../../../domain/repository/medication_repository.dart';
part 'user_requests_history_state.dart';

class UserRequestsHistoryCubit extends Cubit<UserRequestsHistoryState> {
  UserRequestsHistoryCubit({required MedicationRepository medicationRepository})
      : _medicationRepository = medicationRepository,
        super(const UserRequestsHistoryInitial());

  final MedicationRepository _medicationRepository;

  /// A description for yourCustomFunction
  FutureOr<void> getHistory() async {
    emit(const UserRequestsHistoryLoading());
    try {
      final userRequestsHistory = await _medicationRepository
          .getUserHistory(FirebaseAuth.instance.currentUser!.uid);
      emit(UserRequestsHistoryLoaded(medicationItems: userRequestsHistory));
    } catch (e) {
      emit(UserRequestsHistoryError(errorMessage: e.toString()));
    }
  }
}
