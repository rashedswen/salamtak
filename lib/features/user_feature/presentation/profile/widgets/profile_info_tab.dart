import 'package:flutter/material.dart';
import 'package:flutter_bloc/src/bloc_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/src/provider.dart';
import 'package:salamtak/app/bloc/app_bloc.dart';
import 'package:salamtak/features/user_feature/presentation/profile/cubit/profile_cubit.dart';
import 'package:salamtak/l10n/l10n.dart';
import 'package:salamtak/util/constants.dart';

class ProfileInfoTab extends StatelessWidget {
  const ProfileInfoTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () {},
          title: Text(
            context.l10n.name,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey,
                ),
          ),
          subtitle: Text(
            context.read<AppBloc>().state.user.name ?? context.l10n.not_set,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          trailing: Text(
            context.l10n.edit,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: lightGreen,
                ),
          ),
        ),
        ColoredBox(
          color: const Color(0xFFD2EBC7),
          child: ListTile(
            onTap: () {},
            title: Text(
              context.l10n.email,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey,
                  ),
            ),
            subtitle: Text(
              context.read<AppBloc>().state.user.email ?? context.l10n.not_set,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            trailing: Text(
              context.l10n.edit,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: lightGreen,
                  ),
            ),
          ),
        ),
        ListTile(
          onTap: () {},
          title: Text(
            context.l10n.location,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey,
                ),
          ),
          subtitle: Text(
            context
                    .read<AppBloc>()
                    .state
                    .user
                    .location
                    ?.toLocalString(context.l10n.localeName) ??
                context.l10n.not_set,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          trailing: Text(
            context.l10n.edit,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: lightGreen,
                ),
          ),
        ),
        BlocBuilder<ProfileCubit, ProfileState>(
          builder: (blocContext, state) {
            if (!state.providers.twitter) {
              return ColoredBox(
                color: const Color(0xFFD2EBC7),
                child: ListTile(
                  onTap: () {},
                  title: Text(
                    context.l10n.link_with_twitter,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey,
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
        ListTile(
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
      ],
    );
  }
}
