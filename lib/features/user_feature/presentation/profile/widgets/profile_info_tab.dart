import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:salamtak/app/bloc/app_bloc.dart';
import 'package:salamtak/features/user_feature/presentation/profile/cubit/profile_cubit.dart';
import 'package:salamtak/features/user_feature/presentation/profile/widgets/user_info_list_tile.dart';
import 'package:salamtak/l10n/l10n.dart';

class ProfileInfoTab extends StatelessWidget {
  const ProfileInfoTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserInfoListTile(
          text: context.l10n.name,
          value:
              context.read<AppBloc>().state.user.phoneNumber ?? context.l10n.not_set,
          onTap: () {},
          onChanged: (value) {
            context.read<ProfileCubit>().nameChanged(value);
          },
          onSave: () {
            context.read<ProfileCubit>().saveName();
          },
          onCancel: () {
            context.read<ProfileCubit>().nameChanged(null);
          },
        ),
        UserInfoListTile(
          text: context.l10n.name,
          value:
              context.read<AppBloc>().state.user.name ?? context.l10n.not_set,
          onTap: () {},
          onChanged: (value) {
            context.read<ProfileCubit>().nameChanged(value);
          },
          onSave: () {
            context.read<ProfileCubit>().saveName();
          },
          onCancel: () {
            context.read<ProfileCubit>().nameChanged(null);
          },
        ),
        ColoredBox(
          color: Theme.of(context).colorScheme.tertiary,
          child: UserInfoListTile(
            text: context.l10n.email,
            value: context.read<AppBloc>().state.user.email ??
                context.l10n.not_set,
            onTap: () {},
            onSave: () {
              context.read<ProfileCubit>().saveEmail();
            },
            onChanged: (value) {
              context.read<ProfileCubit>().emailChanged(value);
            },
            onCancel: () {
              context.read<ProfileCubit>().emailChanged(null);
            },
          ),
        ),
        BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            return UserInfoListTile(
              text: context.l10n.location,
              value: context
                      .read<AppBloc>()
                      .state
                      .user
                      .location
                      ?.toLocalString(context.l10n.localeName) ??
                  context.l10n.not_set,
              onTap: () {},
              onChanged: (value) {
                context.read<ProfileCubit>().addressChanged(value);
              },
              onLocationChanged: (value) {
                context.read<ProfileCubit>().locationChanged(value);
              },
              onSave: () {
                context.read<ProfileCubit>().saveLocation();
              },
              onCancel: () {
                context.read<ProfileCubit>().locationChanged(null);
              },
              selectedLocation: state.location,
            );
          },
        ),
        BlocBuilder<ProfileCubit, ProfileState>(
          builder: (blocContext, state) {
            if (!state.providers.twitter) {
              return ColoredBox(
                color: Theme.of(context).colorScheme.tertiary,
                child: ListTile(
                  onTap: () {
                    context.read<ProfileCubit>().linkWithTwitter();
                  },
                  title: Text(
                    context.l10n.link_with_twitter,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                  ),
                  trailing: const FaIcon(
                    FontAwesomeIcons.twitter,
                    color: Colors.blue,
                  ),
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
        const SizedBox(
          height: 32,
        ),
        InkWell(
          onTap: () {
            showDialog<bool>(
              context: context,
              builder: (_) => AlertDialog(
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
              ),
            ).then((value) {
              if (value != null && value == true) {
                context.read<ProfileCubit>().deleteAccount();
              }
            });
          },
          child: ListTile(
            title: Text(
              context.l10n.delete_account,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Colors.red),
            ),
            trailing: const Icon(
              FontAwesomeIcons.squareXmark,
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}
