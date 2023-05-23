import 'package:flutter/material.dart';
import 'package:salamtak/features/medication_feature/presentation/add_exchange/cubit/cubit.dart';
import 'package:salamtak/features/medication_feature/presentation/add_exchange/widgets/add_exchange_body.dart';

/// {@template add_exchange_page}
/// A description for AddExchangePage
/// {@endtemplate}
class AddExchangePage extends StatelessWidget {
  /// {@macro add_exchange_page}
  const AddExchangePage({super.key});

  /// The static route for AddExchangePage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const AddExchangePage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddExchangeCubit(),
      child: const Scaffold(
        body: AddExchangeView(),
      ),
    );
  }    
}

/// {@template add_exchange_view}
/// Displays the Body of AddExchangeView
/// {@endtemplate}
class AddExchangeView extends StatelessWidget {
  /// {@macro add_exchange_view}
  const AddExchangeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const AddExchangeBody();
  }
}
