import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:salamtak/features/user_feature/presentation/dashboard/widgets/add_card_item.dart';
import 'package:salamtak/l10n/l10n.dart';
import 'package:salamtak/util/router/screen.dart';

class AddSection extends StatelessWidget {
  const AddSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: AddCardItem(
            icon: FontAwesomeIcons.handHoldingHeart,
            text: context.l10n.donation,
            onTap: () {
              context.pushNamed(
                Screens.addDonation.name,
              );
            },
          ),
        ),
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: constraints.maxHeight,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: RowAddCard(
                        icon: FontAwesomeIcons.arrowRightArrowLeft,
                        text: 'تبادل',
                        isVertical: false,
                        onTap: () {},
                      ),
                    ),
                    Expanded(
                      child: RowAddCard(
                        icon: FontAwesomeIcons.capsules,
                        text: context.l10n.request,
                        onTap: () {
                          context.pushNamed(
                            Screens.addRequest.name,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
