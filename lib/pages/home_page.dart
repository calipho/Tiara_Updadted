import 'dart:io';

import 'package:bank_project/pages/transactions_page.dart';
import 'package:bank_project/providers/auth_providers.dart';
import 'package:bank_project/services/client.dart';
import 'package:bank_project/widgets/actions.dart';
import 'package:bank_project/widgets/curren_balance.dart';
import 'package:bank_project/widgets/drawer.dart';
import 'package:bank_project/widgets/recent_transactions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:bank_project/services/trans_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (!context.read<AuthProviders>().isAuth) {
        context.push("/signin");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _sKey = GlobalKey();
    return Consumer<AuthProviders>(builder: (context, auth, child) {
      return Scaffold(
          key: _sKey,
          drawer: const Drawer(child: DrawerMenu()),
          body: Padding(
            padding: const EdgeInsets.only(top: 12.0, left: 40, right: 40),
            child: SafeArea(
                child: SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        icon: const Icon(Icons.menu),
                        onPressed: () => {_sKey.currentState?.openDrawer()},
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: SizedBox(
                          width: 40,
                          height: 40,
                          child: InkWell(
                              onTap: () => {context.push("/profile")},
                              child: Image.network(
                                auth.user?.image ??
                                    "https://media.istockphoto.com/vectors/user-avatar-profile-icon-black-vector-illustration-vector-id1209654046?s=612x612",
                                fit: BoxFit.fitHeight,
                              )),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // const ActionButtons(),
                  RecentTrips(list: "recenet", filter: "all")
                ],
              ),
            )),
          ));
    });
  }
}
