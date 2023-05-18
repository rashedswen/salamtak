import 'package:flutter/material.dart';

/// {@template user_requests_history_body}
/// Body of the UserRequestsHistoryPage.
///
/// Add what it does
/// {@endtemplate}
class UserRequestsHistoryBody extends StatelessWidget {
  /// {@macro user_requests_history_body}
  const UserRequestsHistoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 200,
        width: 200,
        color: Colors.teal,
        child: SizedBox(
          child: Image.network(
            'https://img.rawpixel.com/private/static/images/website/2022-05/366-mj-7703-fon-jj.jpg?w=800&dpr=1&fit=default&crop=default&q=65&vib=3&con=3&usm=15&bg=F4F4F3&ixlib=js-2.2.1&s=f23359a06a626e56bedb45dac2809feb',
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }
}
