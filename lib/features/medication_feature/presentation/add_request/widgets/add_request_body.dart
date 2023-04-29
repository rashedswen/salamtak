import 'package:flutter/material.dart';
import 'package:salamtak/features/medication_feature/presentation/add_request/cubit/cubit.dart';

/// {@template add_request_body}
/// Body of the AddRequestPage.
///
/// Add what it does
/// {@endtemplate}
class AddRequestBody extends StatelessWidget {
  /// {@macro add_request_body}
  const AddRequestBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddRequestCubit, AddRequestState>(
      builder: (context, state) {
        return Center(child: Text(state.customProperty));
      },
    );
  }
}
