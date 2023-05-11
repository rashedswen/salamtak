import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../app/bloc/app_bloc.dart';
import '../../../domain/repository/authentication_repository.dart';
import '../cubit/cubit.dart';
import '../widgets/login_body.dart';
import '../../../../../l10n/l10n.dart';
import '../../../../../util/router/screen.dart';

/// {@template login_page}
/// A description for LoginPage
/// {@endtemplate}
class LoginPage extends StatelessWidget {
  /// {@macro login_page}
  const LoginPage({super.key});

  /// The static route for LoginPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(
        authenticationRepository: context.read<AuthenticationRepository>(),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.l10n.login),
        ),
        body: const LoginView(),
      ),
    );
  }
}

/// {@template login_view}
/// Displays the Body of LoginView
/// {@endtemplate}
class LoginView extends StatelessWidget {
  /// {@macro login_view}
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppBloc, AppState>(
      listener: (context, state) {
        if (state.status == AppStatus.authenticated) {
          print('authenticated');
          context.pushReplacementNamed(Screens.dashboard.name);
        }
      },
      child: const LoginBody(),
    );
  }
}
