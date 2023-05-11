import 'package:flutter/src/material/card.dart';
import 'package:flutter/src/material/dialog.dart';
import 'package:flutter/src/material/icons.dart';
import 'package:flutter/src/material/list_tile.dart';
import 'package:flutter/src/material/scaffold.dart';
import 'package:flutter/src/material/snack_bar.dart';
import 'package:flutter/src/material/text_button.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/icon.dart';
import 'package:flutter/src/widgets/text.dart';
import 'package:flutter_bloc/src/bloc_builder.dart';
import 'package:flutter_bloc/src/bloc_listener.dart';
import 'package:flutter_bloc/src/bloc_provider.dart';
import 'package:go_router/src/misc/extensions.dart';
import 'package:provider/src/provider.dart';
import '../../../../../core/widgets/text_with_field.dart';
import '../../../domain/repository/authentication_repository.dart';
import '../cubit/profile_cubit.dart';
import '../../../../../l10n/l10n.dart';

class LinkWithEmail extends StatelessWidget {
  const LinkWithEmail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      buildWhen: (previous, current) => previous.providers != current.providers,
      builder: (context, state) {
        if (!state.providers.email) {
          return Card(
            child: ListTile(
              leading: const Icon(Icons.email),
              title: Text(context.l10n.link_with_email),
              onTap: () {
                showDialog<void>(
                  context: context,
                  builder: (contextD) => BlocProvider(
                    create: (context) => ProfileCubit(
                      authenticationRepository:
                          context.read<AuthenticationRepository>(),
                    ),
                    child: BlocListener<ProfileCubit, ProfileState>(
                      listener: (context, state) {
                        if (state.status == ProfileStatus.success) {
                          context.pop();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                context.l10n.linked_successfully,
                              ),
                            ),
                          );
                        } else if (state.status == ProfileStatus.error) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                context.l10n.error,
                              ),
                            ),
                          );
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: SimpleDialog(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          children: [
                            TextWithField(
                              text: context.l10n.email,
                              onChanged: (value) {
                                context
                                    .read<ProfileCubit>()
                                    .emailChanged(value);
                              },
                            ),
                            TextWithField(
                              text: context.l10n.password,
                              onChanged: (value) {
                                context
                                    .read<ProfileCubit>()
                                    .passwordChanged(value);
                              },
                            ),
                            TextButton(
                              onPressed: () {
                                context
                                    .read<ProfileCubit>()
                                    .linkWithEmailAndPassword();
                              },
                              child: Text(context.l10n.link_with_email),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
