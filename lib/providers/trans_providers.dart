import 'dart:convert';
import 'dart:io';

import 'package:bank_project/models/trips.dart';
import 'package:bank_project/pages/transactions_page.dart';
import 'package:bank_project/services/trans_services.dart';
import 'package:flutter/material.dart';

class TripsProviders extends ChangeNotifier {
  List<Trips> trips = [];

  Future<List> getTrips() async {
    trips = (await TripsServices().getTrips())!;
    return trips;
    // notifyListeners();
  }
}
