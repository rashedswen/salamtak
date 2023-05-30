import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:salamtak/app/bloc/app_bloc.dart';
import 'package:salamtak/core/widgets/salamtak_drawer.dart';
import 'package:salamtak/features/user_feature/domain/repository/authentication_repository.dart';
import 'package:salamtak/features/user_feature/presentation/register/cubit/cubit.dart';
import 'package:salamtak/features/user_feature/presentation/register/widgets/register_body.dart';
import 'package:salamtak/features/user_feature/presentation/register/widgets/register_body_web.dart';
import 'package:salamtak/util/layout/responsive_layout.dart';
import 'package:salamtak/util/router/screen.dart';

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
      child: const Scaffold(
        body: RegisterView(),
        drawer: SalamtakDrawer(),
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
      child: const ResponsiveLayout(
        mobileBody: RegisterBody(),
        tabletBody: RegisterBody(),
        webBody: RegisterBodyWeb(),
      ),
    );
  }
}
