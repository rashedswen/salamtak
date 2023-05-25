import 'package:flutter/material.dart';
import 'package:go_router/src/misc/extensions.dart';
import 'package:provider/src/provider.dart';
import 'package:salamtak/app/bloc/app_bloc.dart';
import 'package:salamtak/l10n/l10n.dart';
import 'package:salamtak/util/router/screen.dart';

class SalamtakWebAppBar extends StatelessWidget {
  const SalamtakWebAppBar({
    super.key,
    this.onSidebarTap,
  });

  final void Function()? onSidebarTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          if (onSidebarTap != null)
            IconButton(
              onPressed: onSidebarTap,
              icon: Icon(
                Icons.menu,
                color: Theme.of(context).primaryColor,
              ),
            ),
          InkWell(
            onTap: () {
              context.pushNamed(
                Screens.dashboard.name,
              );
            },
            child: Theme.of(context).brightness == Brightness.dark
                ? ColorFiltered(
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                    child: Image.asset(
                      'assets/images/logo_transparent.png',
                      width: 80,
                      height: 80,
                    ),
                  )
                : Image.asset(
                    'assets/images/logo_transparent.png',
                    width: 80,
                    height: 80,
                  ),
          ),
          // const SizedBox(
          //   width: 16,
          // ),
          // const SizedBox(
          //   width: 500,
          //   child: SalamtakSearchBar(),
          // ),
          const Spacer(),
          TextButton(
            onPressed: () {},
            child: Text(
              context.l10n.contact_us,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          TextButton(
            onPressed: () {
              context.pushNamed(
                Screens.privacyPolicy.name,
              );
            },
            child: Text(
              context.l10n.privacy_policy,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          if (context.read<AppBloc>().state.status == AppStatus.authenticated)
            TextButton(
              onPressed: () {
                context.read<AppBloc>().add(AppLogoutRequested());
                context.pushNamed(
                  Screens.login.name,
                );
              },
              child: Text(
                context.l10n.logout,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
              ),
            )
          else
            TextButton(
              onPressed: () {
                context.pushNamed(
                  Screens.login.name,
                );
              },
              child: Text(
                context.l10n.login,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
              ),
            ),
        ],
      ),
    );
  }
}
