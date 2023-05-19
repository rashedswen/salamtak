import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:salamtak/app/bloc/app_bloc.dart';
import 'package:salamtak/core/widgets/drawet_item.dart';
import 'package:salamtak/l10n/l10n.dart';
import 'package:salamtak/util/router/screen.dart';

class SalamtakDrawer extends StatelessWidget {
  const SalamtakDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
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
                      DrawetItem(
                        text: context.l10n.home,
                        icon: FontAwesomeIcons.house,
                        onTap: () {
                          context.pushNamed(
                            Screens.dashboard.name,
                          );
                        },
                      ),
                      // DrawetItem(
                      //   icon: FontAwesomeIcons.clock,
                      //   text: context.l10n.recent_requests_and_donations,
                      //   onTap: () {
                      //     context.pushNamed(
                      //       Screens.userHistory.name,
                      //     );
                      //   },
                      // ),
                      const Spacer(),
                      if (context.read<AppBloc>().state.user.authorization ==
                              'checker' ||
                          context.read<AppBloc>().state.user.authorization ==
                              'admin')
                        DrawetItem(
                          icon: FontAwesomeIcons.userShield,
                          text: context.l10n.adminPanel,
                          onTap: () {
                            context.pushNamed(
                              Screens.approveMedicationsRequests.name,
                            );
                          },
                        ),
                      BlocBuilder<AppBloc, AppState>(
                        builder: (context, state) {
                          if (state.status == AppStatus.authenticated) {
                            return Column(
                              children: [
                                DrawetItem(
                                  icon: FontAwesomeIcons.circleUser,
                                  text: context.l10n.profile,
                                  onTap: () {
                                    context.pushNamed(
                                      Screens.profile.name,
                                    );
                                  },
                                ),
                                DrawetItem(
                                  icon: FontAwesomeIcons.arrowRightToBracket,
                                  text: context.l10n.logout,
                                  onTap: () {
                                    context
                                        .read<AppBloc>()
                                        .add(AppLogoutRequested());
                                  },
                                ),
                              ],
                            );
                          } else {
                            return DrawetItem(
                              icon: FontAwesomeIcons.arrowRightToBracket,
                              text: context.l10n.login,
                              onTap: () {
                                context.pushNamed(
                                  Screens.login.name,
                                );
                              },
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
