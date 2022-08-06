import 'package:bank_project/providers/auth_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContollBalance extends StatelessWidget {
  final String method;
  const ContollBalance({Key? key, required this.method}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProviders>(builder: (context, auth, child) {
      return Container(
        child: Text(
          'Trips',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    });
  }
}
