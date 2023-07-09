import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:salamtak/features/user_feature/domain/repository/authentication_repository.dart';
import 'package:salamtak/features/user_feature/presentation/login_with_phone_number/cubit/cubit.dart';
import 'package:salamtak/features/user_feature/presentation/login_with_phone_number/widgets/login_with_phone_number_body.dart';
import 'package:salamtak/util/router/screen.dart';

@Deprecated('Not Working in sudan')
class LoginWithPhoneNumberPage extends StatelessWidget {
  @Deprecated('Not Working in sudan')
  const LoginWithPhoneNumberPage({super.key});

  /// The static route for LoginWithPhoneNumberPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const LoginWithPhoneNumberPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginWithPhoneNumberCubit(
        authenticationRepository: context.read<AuthenticationRepository>(),
      ),
      child: const Scaffold(
        body: LoginWithPhoneNumberView(),
      ),
    );
  }
}

/// {@template login_with_phone_number_view}
/// Displays the Body of LoginWithPhoneNumberView
/// {@endtemplate}
class LoginWithPhoneNumberView extends StatelessWidget {
  /// {@macro login_with_phone_number_view}
  const LoginWithPhoneNumberView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginWithPhoneNumberCubit, LoginWithPhoneNumberState>(
      listener: (context, state) {
        if (state.verificationStatus ==
            LoginWithPhoneNumberVerificationStatus.success) {
          context.pushNamed(Screens.dashboard.name);
        }
        if (state.verificationStatus ==
            LoginWithPhoneNumberVerificationStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Something went wrong please try again'),
            ),
          );
        }
        if (state.submitStatus == LoginWithPhoneNumberSubmitStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Something went wrong please try again'),
            ),
          );
        }
      },
      child: const LoginWithPhoneNumberBody(),
    );
  }
}
