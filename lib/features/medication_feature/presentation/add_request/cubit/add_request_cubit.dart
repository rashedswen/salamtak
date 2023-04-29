import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'add_request_state.dart';

class AddRequestCubit extends Cubit<AddRequestState> {
  AddRequestCubit() : super(const AddRequestInitial());

  /// A description for yourCustomFunction 
  FutureOr<void> yourCustomFunction() {
    // TODO: Add Logic
  }
}
