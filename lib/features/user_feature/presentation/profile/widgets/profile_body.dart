import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:salamtak/app/bloc/app_bloc.dart';
import 'package:salamtak/core/widgets/text_with_field.dart';
import 'package:salamtak/features/user_feature/presentation/profile/cubit/cubit.dart';
import 'package:salamtak/features/user_feature/presentation/profile/widgets/link_with_email.dart';
import 'package:salamtak/l10n/l10n.dart';
import 'package:salamtak/util/router/screen.dart';

/// {@template profile_body}
/// Body of the ProfilePage.
///
/// Add what it does
/// {@endtemplate}
class ProfileBody extends StatefulWidget {
  /// {@macro profile_body}
  const ProfileBody({super.key});

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileCubit>().getProviders();
  }

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
          BlocBuilder<AppBloc, AppState>(
            buildWhen: (previous, current) =>
                previous.user.email != current.user.email,
            builder: (context, state) {
              if (state.user.email == null) {
                return const SizedBox.shrink();
              }
              return Card(
                child: ListTile(
                  leading: const Icon(Icons.email),
                  title: Text(context.l10n.email),
                  subtitle: Text(state.user.email ?? ''),
                ),
              );
            },
          ),
          const LinkWithEmail(),
          BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              if (state.providers.twitter) {
                return const SizedBox.shrink();
              }
              return Card(
                child: ListTile(
                  leading: const Icon(Icons.link),
                  title: Text(context.l10n.link_with_twitter),
                  onTap: () {
                    context.read<ProfileCubit>().linkWithTwitter();
                  },
                ),
              );
            },
          ),
          const Spacer(),
          Card(
            child: ListTile(
              leading: const Icon(Icons.delete),
              title: Text(
                context.l10n.delete_account,
                style: const TextStyle(color: Colors.red),
              ),
              onTap: () {
                // show dialog to confirm delete
                showDialog<bool>(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(context.l10n.delete_account),
                      content: Text(context.l10n.delete_account_confirmation),
                      actions: [
                        TextButton(
                          onPressed: () {
                            context.pop(false);
                          },
                          child: Text(context.l10n.cancel),
                        ),
                        TextButton(
                          onPressed: () {
                            context.pop(true);
                          },
                          child: Text(context.l10n.delete),
                        ),
                      ],
                    );
                  },
                ).then((value) async {
                  if (value != null && value == true) {
                    await context.read<ProfileCubit>().deleteAccount();
                    if (!mounted) return;
                    await context.pushNamed(Screens.login.name);
                  }
                });
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: Text(
                context.l10n.logout,
                style: const TextStyle(color: Colors.red),
              ),
              onTap: () {
                context.read<AppBloc>().add(AppLogoutRequested());
              },
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
