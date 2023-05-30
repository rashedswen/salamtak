import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:salamtak/core/widgets/salamtak_drawer.dart';
import 'package:salamtak/features/medication_feature/domain/repository/medication_repository.dart';
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
      create: (context) => AddExchangeCubit(
        medicationRepository: context.read<MedicationRepository>(),
      ),
      child: const Scaffold(
        body: AddExchangeView(),
        drawer: SalamtakDrawer(),
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
    return BlocListener<AddExchangeCubit, AddExchangeState>(
      listener: (context, state) {
        if (state.status == AddExchangeStatus.success) {
          context.pop();
        }

        if (state.status == AddExchangeStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMassage ?? 'Error'),
            ),
          );
        }
      },
      child: const AddExchangeBody(),
    );
  }
}
