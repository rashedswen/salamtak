import 'package:flutter/material.dart';
import 'package:salamtak/core/widgets/salamtak_drawer.dart';
import 'package:salamtak/features/medication_feature/domain/repository/medication_repository.dart';
import 'package:salamtak/features/medication_feature/presentation/add_request/cubit/cubit.dart';
import 'package:salamtak/features/medication_feature/presentation/add_request/widgets/add_request_body.dart';
import 'package:salamtak/features/medication_feature/presentation/add_request/widgets/web/add_request_web_body.dart';
import 'package:salamtak/util/layout/responsive_layout.dart';

/// {@template add_request_page}
/// A description for AddRequestPage
/// {@endtemplate}
class AddRequestPage extends StatelessWidget {
  /// {@macro add_request_page}
  const AddRequestPage({super.key});

  /// The static route for AddRequestPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const AddRequestPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AddRequestCubit(context.read<MedicationRepository>()),
      child: const Scaffold(
        body: AddRequestView(),
        drawer: SalamtakDrawer(),
      ),
    );
  }
}

/// {@template add_request_view}
/// Displays the Body of AddRequestView
/// {@endtemplate}
class AddRequestView extends StatelessWidget {
  /// {@macro add_request_view}
  const AddRequestView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddRequestCubit, AddRequestState>(
      listener: (context, state) {
        if (state.status == AddRequestStatus.success) {
          Navigator.of(context).pop();
        }
      },
      child: const ResponsiveLayout(
        mobileBody: AddRequestBody(),
        tabletBody: AddRequestWebBody(),
        webBody: AddRequestWebBody(),
      ),
    );
  }
}
