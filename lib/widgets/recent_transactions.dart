import 'package:bank_project/pages/transactions_page.dart';
import 'package:bank_project/providers/trans_providers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class RecentTrips extends StatefulWidget {
  final list;
  var filter;
  RecentTrips({Key? key, required this.list, required this.filter})
      : super(key: key);

  @override
  State<RecentTrips> createState() => _RecentTripsState();
}

class _RecentTripsState extends State<RecentTrips> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: context.read<TripsProviders>().getTrips(),
        builder: (context, dataSnapshot) {
          if (dataSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Consumer<TripsProviders>(builder: (context, trans, child) {
              return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount:
                      widget.list != "all" ? list().length + 1 : list().length,
                  itemBuilder: ((context, index) => index == 0 &&
                          widget.list != "all"
                      ? Padding(
                          padding: const EdgeInsets.only(
                              right: 8.0, top: 20.0, bottom: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Recent Trips",
                                style: TextStyle(fontWeight: FontWeight.w900),
                              ),
                              TextButton(
                                onPressed: () {
                                  context.push("/trips");
                                },
                                child: const Text(
                                  "See all",
                                  style: TextStyle(fontSize: 11),
                                ),
                              )
                            ],
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Home to Work",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600),
                                  ),
                                  // Padding(
                                  //   padding: const EdgeInsets.only(top: 3.0),
                                  //   child: Text(
                                  //     list()[widget.list != "all"?index-1:index].date,
                                  //     style: const TextStyle(
                                  //         fontSize: 10, color: Colors.grey),
                                  //   ),
                                  // )
                                ],
                              ),
                              SizedBox(
                                // width: 65,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Kuwait Trip",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      list()[widget.list != "all"
                                                  ? index - 1
                                                  : index]
                                              .destination ??
                                          "",
                                      style: const TextStyle(
                                          fontSize: 10, color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )));
            });
          }
        });
  }

  List<Trips> list() {
    if (widget.filter != "all") {
      List<Trips> filteredList = context
          .watch<TripsProviders>()
          .trips
          .where((element) => element.destination == widget.filter)
          .toList();

      return filteredList;
    } else {
      List<Trips> trips = context.watch<TripsProviders>().trips;
      return trips;
    }
  }
}
