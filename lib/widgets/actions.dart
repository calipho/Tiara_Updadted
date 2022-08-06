import 'package:bank_project/widgets/control_balance.dart';
import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const ContollBalance(
                    method: "send",
                  );
                });
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 3.0),
                  child: Transform.rotate(
                    angle: -0.5,
                    child: const Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 15,
                    ),
                  ),
                ),
                const Text("Send",
                    style: TextStyle(color: Colors.white, fontSize: 10))
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  String method = "deposit";
                  return ContollBalance(
                    method: method,
                  );
                });
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 3.0),
                  child: Transform.rotate(
                    angle: 1.55,
                    child: const Icon(
                      Icons.login,
                      color: Colors.white,
                      size: 15,
                    ),
                  ),
                ),
                const Text("Deposit",
                    style: TextStyle(color: Colors.white, fontSize: 10))
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  String method = "withdraw";
                  return ContollBalance(
                    method: method,
                  );
                });
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 3.0),
                  child: Transform.rotate(
                    angle: -1.55,
                    child:
                        const Icon(Icons.logout, color: Colors.white, size: 15),
                  ),
                ),
                const Text("Withdraw",
                    style: TextStyle(color: Colors.white, fontSize: 10))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
