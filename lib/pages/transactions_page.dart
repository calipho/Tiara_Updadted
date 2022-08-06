import 'package:bank_project/widgets/recent_transactions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bank_project/models/trips.dart';

class Trips extends StatefulWidget {
  // const Trips(name,
  //     {Key? key,
  //     String tripAmount = '',
  //     String tripDescription = '',
  //     String tripDate = ''})
  //     : super(key: key);

  get destination => null;

  @override
  State<Trips> createState() => _TripsState();

  static fromJson(trips) {}
}

class _TripsState extends State<Trips> {
  String filter = "date";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Trips"),
        backgroundColor: Color.fromARGB(207, 209, 197, 197),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: filter == "all" ? Colors.black : Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        filter = "all";
                      });
                    },
                    child: const Text("All")),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: filter == "date" ? Colors.black : Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        filter = "date";
                      });
                    },
                    child: const Text("date")),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary:
                          filter == "destination" ? Colors.black : Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        filter = "destination";
                      });
                    },
                    child: const Text("destination")),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary:
                          filter == "traveller" ? Colors.black : Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        filter = "traveller";
                      });
                    },
                    child: const Text("traveller")),
              ],
            ),
            RecentTrips(list: "all", filter: filter),
          ],
        ),
      ),
    );
  }
}
