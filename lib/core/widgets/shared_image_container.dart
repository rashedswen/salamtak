import 'package:flutter/material.dart';

class SharedImageContainer extends StatelessWidget {
  const SharedImageContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: BoxDecoration(
        image: Theme.of(context).brightness == Brightness.light
            ? const DecorationImage(
                image: AssetImage('assets/images/login_logo.png'),
                fit: BoxFit.contain,
              )
            : null,
      ),
      child: Theme.of(context).brightness == Brightness.light
          ? null
          : ColorFiltered(
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
              child: Image.asset(
                'assets/images/login_logo.png',
                height: 150,
              ),
            ),
    );
  }
}
