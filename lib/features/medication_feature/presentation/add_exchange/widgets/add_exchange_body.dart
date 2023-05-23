import 'package:flutter/material.dart';
import 'package:salamtak/features/medication_feature/presentation/add_exchange/cubit/cubit.dart';

/// {@template add_exchange_body}
/// Body of the AddExchangePage.
///
/// Add what it does
/// {@endtemplate}
class AddExchangeBody extends StatelessWidget {
  /// {@macro add_exchange_body}
  const AddExchangeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddExchangeCubit, AddExchangeState>(
      builder: (context, state) {
        return Center(child: Text(state.customProperty));
      },
    );
  }
}
