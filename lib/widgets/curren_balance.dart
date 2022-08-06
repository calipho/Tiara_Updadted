import 'package:bank_project/providers/auth_providers.dart';
import 'package:bank_project/widgets/actions.dart';
import 'package:bank_project/widgets/control_balance.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurrenBalance extends StatelessWidget {
  const CurrenBalance({Key? key}) : super(key: key);
  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8.0,
        bottom: 8.0,
      ),
      child: Container(
          width: 340,
          height: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            // color: Colors.black,

            gradient: const LinearGradient(
              colors: [
                Color.fromARGB(255, 0, 0, 0),
                Color.fromARGB(255, 196, 196, 196),
              ],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(2.0, 3.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Consumer<AuthProviders>(builder: (context, auth, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        capitalize(auth.user?.username ?? ""),
                        style: const TextStyle(
                            color: Color.fromARGB(255, 197, 197, 197),
                            fontSize: 12),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Current Balance",
                            style: TextStyle(
                                color: Color.fromARGB(255, 197, 197, 197),
                                fontSize: 12),
                          ),
                          Text(
                            "KWD ${auth.user?.balance}",
                            style: const TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 20),
                          ),
                        ],
                      ),
                      const ActionButtons()
                    ],
                  ),
                  // IconButton(
                  //   onPressed: () {
                  //     showDialog(
                  //         context: context,
                  //         builder: (BuildContext context) {
                  //           String method = "deposit";
                  //           return ContollBalance(
                  //             method: method,
                  //           );
                  //         });
                  //   },
                  //   icon: const Icon(
                  //     Icons.add,
                  //     color: Colors.white,
                  //   ),
                  // )
                ],
              );
            }),
          )),
    );
  }
}
