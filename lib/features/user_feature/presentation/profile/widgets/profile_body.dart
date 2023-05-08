import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:salamtak/app/bloc/app_bloc.dart';
import 'package:salamtak/core/widgets/text_with_field.dart';
import 'package:salamtak/features/user_feature/presentation/profile/cubit/cubit.dart';
import 'package:salamtak/l10n/l10n.dart';

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
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Card(
            child: BlocBuilder<AppBloc, AppState>(
              builder: (context, state) {
                return ListTile(
                  leading: const Icon(Icons.person),
                  title: Text(context.l10n.name),
                  subtitle: BlocBuilder<AppBloc, AppState>(
                    builder: (context, state) {
                      return Text(state.user.name ?? '');
                    },
                  ),
                  onTap: () async {
                    final s = await changeDialog(context, context.l10n.name)
                        as String?;
                    if (s != null) {
                      await context
                          .read<ProfileCubit>()
                          .nameChanged(s, context.read<AppBloc>().state.user);
                    }

                    log(s.toString());
                  },
                );
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.phone),
              title: Text(context.l10n.phone),
              subtitle: Text(
                context.read<AppBloc>().state.user.phoneNumber ?? '',
              ),
              onTap: () async {
                final value =
                    await changeDialog(context, context.l10n.phone) as String?;
                if (value != null) {
                  await context.read<ProfileCubit>().phoneNumberChanged(
                        value,
                        context.read<AppBloc>().state.user,
                      );
                }
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.email),
              title: Text(context.l10n.email),
              subtitle: const Text('Email'),
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> changeDialog(BuildContext context, String title) {
    return showDialog(
      context: context,
      builder: (context) {
        final textController = TextEditingController();
        return SimpleDialog(
          title: Text(title),
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextWithField(
                text: title,
                onChanged: (value) {
                  textController.text = value;
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    context.pop();
                  },
                  child: Text(context.l10n.cancel),
                ),
                TextButton(
                  onPressed: () {
                    context.pop(textController.text);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(context.l10n.changes_will_be_saved_soon),
                      ),
                    );
                  },
                  child: Text(context.l10n.save),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
