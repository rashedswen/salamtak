import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'add_exchange_state.dart';

class AddExchangeCubit extends Cubit<AddExchangeState> {
  AddExchangeCubit() : super(const AddExchangeInitial());

  /// A description for yourCustomFunction 
  FutureOr<void> yourCustomFunction() {
    // TODO: Add Logic
  }
}
