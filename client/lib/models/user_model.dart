import 'package:flutter/material.dart';

import 'listing.dart';

class UserModel extends ChangeNotifier {
  final List<Listing> _listings = [];

  void add(Listing listing) {
    _listings.add(listing);
    notifyListeners();
  }

  void addAll(List<Listing> listings) {
    _listings.addAll(listings);
    notifyListeners();
  }
}
