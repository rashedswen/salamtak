import 'package:flutter/src/material/list_tile.dart';
import 'package:flutter/src/material/theme.dart';
import 'package:flutter/src/painting/text_style.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/icon.dart';
import 'package:flutter/src/widgets/icon_data.dart';
import 'package:flutter/src/widgets/text.dart';

class DrawetItem extends StatelessWidget {
  const DrawetItem({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  final String text;
  final IconData icon;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Theme.of(context).colorScheme.onPrimary,
      ),
      title: Text(
        text,
        style: TextStyle(
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
      onTap: onTap,
    );
  }
}
