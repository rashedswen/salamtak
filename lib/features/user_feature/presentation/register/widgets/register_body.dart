import 'package:flutter/material.dart';
import 'package:salamtak/features/user_feature/presentation/register/cubit/cubit.dart';

/// {@template register_body}
/// Body of the RegisterPage.
///
/// Add what it does
/// {@endtemplate}
class RegisterBody extends StatelessWidget {
  /// {@macro register_body}
  const RegisterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return Center(child: Text(state.customProperty));
      },
    );
  }
}
