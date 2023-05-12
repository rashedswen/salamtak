import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:salamtak/app/bloc/app_bloc.dart';
import 'package:salamtak/l10n/l10n.dart';
import 'package:salamtak/util/router/screen.dart';

class SalamtakDrawer extends StatelessWidget {
  const SalamtakDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppBloc, AppState>(
      listener: (context, state) {
        if (state.status == AppStatus.unauthenticated) {
          context.pushNamed(Screens.login.name);
        }
      },
      child: Drawer(
        child: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                    minWidth: constraints.maxWidth,
                  ),
                  child: IntrinsicHeight(
                    child: Column(
                      children: [
                        ListTile(
                          leading: const Icon(Icons.home),
                          title: Text(context.l10n.home),
                          onTap: () {
                            context.pushNamed(
                              Screens.dashboard.name,
                            );
                          },
                        ),
                        ListTile(
                          leading: const FaIcon(FontAwesomeIcons.clock),
                          title:
                              Text(context.l10n.recent_requests_and_donations),
                          onTap: () {
                            context.pushNamed(
                              Screens.userHistory.name,
                            );
                          },
                        ),
                        const Spacer(),
                        if (context.read<AppBloc>().state.user.authorization ==
                                'checker' ||
                            context.read<AppBloc>().state.user.authorization ==
                                'admin')
                          ListTile(
                            leading: const FaIcon(FontAwesomeIcons.userShield),
                            title: Text(context.l10n.adminPanel),
                            onTap: () {
                              context.pushNamed(
                                Screens.approveMedicationsRequests.name,
                              );
                            },
                          ),
                        ListTile(
                          leading: const FaIcon(FontAwesomeIcons.circleUser),
                          title: Text(context.l10n.profile),
                          onTap: () {
                            context.pushNamed(
                              Screens.profile.name,
                            );
                          },
                        ),
                        ListTile(
                          leading: const FaIcon(
                            FontAwesomeIcons.arrowRightToBracket,
                            color: Colors.red,
                          ),
                          title: Text(
                            context.l10n.logout,
                            style: const TextStyle(color: Colors.red),
                          ),
                          onTap: () {
                            context.read<AppBloc>().add(AppLogoutRequested());
                          },
                        ),
                        Row(
                          children: [
                            TextButton(
                              onPressed: () {
                                context.pushNamed(Screens.privacyPolicy.name);
                              },
                              child: Text(context.l10n.privacy_policy),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
