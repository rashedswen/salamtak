import 'package:flutter/material.dart';
import 'package:salamtak/features/admin_feature/presentation/users/cubit/cubit.dart';
import 'package:salamtak/features/admin_feature/presentation/users/widgets/users_body.dart';

/// {@template users_page}
/// A description for UsersPage
/// {@endtemplate}
class UsersPage extends StatelessWidget {
  /// {@macro users_page}
  const UsersPage({super.key});

  /// The static route for UsersPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const UsersPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UsersCubit(),
      child: const Scaffold(
        body: UsersView(),
      ),
    );
  }    
}

/// {@template users_view}
/// Displays the Body of UsersView
/// {@endtemplate}
class UsersView extends StatelessWidget {
  /// {@macro users_view}
  const UsersView({super.key});

  @override
  Widget build(BuildContext context) {
    return const UsersBody();
  }
}
