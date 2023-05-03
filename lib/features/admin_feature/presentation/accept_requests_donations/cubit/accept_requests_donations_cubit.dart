import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'accept_requests_donations_state.dart';

class AcceptRequestsDonationsCubit extends Cubit<AcceptRequestsDonationsState> {
  AcceptRequestsDonationsCubit() : super(const AcceptRequestsDonationsInitial());

  /// A description for yourCustomFunction 
  FutureOr<void> yourCustomFunction() {
    // TODO: Add Logic
  }
}
