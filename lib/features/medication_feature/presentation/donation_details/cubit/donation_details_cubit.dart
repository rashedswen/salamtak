import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'donation_details_state.dart';

class DonationDetailsCubit extends Cubit<DonationDetailsState> {
  DonationDetailsCubit() : super(const DonationDetailsInitial());

  /// A description for yourCustomFunction 
  FutureOr<void> yourCustomFunction() {
    // TODO: Add Logic
  }
}
