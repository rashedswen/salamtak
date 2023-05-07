import 'package:flutter/material.dart';
import 'package:salamtak/features/user_feature/presentation/profile/cubit/cubit.dart';

/// {@template profile_body}
/// Body of the ProfilePage.
///
/// Add what it does
/// {@endtemplate}
class ProfileBody extends StatelessWidget {
  /// {@macro profile_body}
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return Center(child: Text(state.customProperty));
      },
    );
  }
}
