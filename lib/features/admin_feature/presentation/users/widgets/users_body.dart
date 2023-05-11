import 'package:flutter/material.dart';
import '../cubit/cubit.dart';

/// {@template users_body}
/// Body of the UsersPage.
///
/// Add what it does
/// {@endtemplate}
class UsersBody extends StatelessWidget {
  /// {@macro users_body}
  const UsersBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersCubit, UsersState>(
      builder: (context, state) {
        return Center(child: Text(state.customProperty));
      },
    );
  }
}
