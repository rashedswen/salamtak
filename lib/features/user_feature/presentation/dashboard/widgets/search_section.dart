import 'package:flutter/material.dart';
import 'package:salamtak/core/widgets/salamtak_button.dart';
import 'package:salamtak/features/user_feature/presentation/dashboard/widgets/salamtak_search_bar.dart';
import 'package:salamtak/l10n/l10n.dart';
import 'package:salamtak/util/constants.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SalamtakSearchBar(),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: SalamtakButton(
            text: context.l10n.search,
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
