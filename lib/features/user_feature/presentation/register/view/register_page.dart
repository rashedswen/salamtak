import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../app/bloc/app_bloc.dart';
import '../../../domain/repository/authentication_repository.dart';
import '../cubit/cubit.dart';
import '../widgets/register_body.dart';
import '../../../../../l10n/l10n.dart';
import '../../../../../util/router/screen.dart';

/// {@template register_page}
/// A description for RegisterPage
/// {@endtemplate}
class RegisterPage extends StatelessWidget {
  /// {@macro register_page}
  const RegisterPage({super.key});

  /// The static route for RegisterPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const RegisterPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(
        authenticationRepository: context.read<AuthenticationRepository>(),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.l10n.signup),
        ),
        body: const RegisterView(),
      ),
    );
  }
}

/// {@template register_view}
/// Displays the Body of RegisterView
/// {@endtemplate}
class RegisterView extends StatelessWidget {
  /// {@macro register_view}
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppBloc, AppState>(
      listener: (context, state) {
        if (state.status == AppStatus.authenticated) {
          context.pushReplacementNamed(Screens.dashboard.name);
        }
      },
      child: const RegisterBody(),
    );
  }
}
