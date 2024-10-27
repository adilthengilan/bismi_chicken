import 'package:flutter/material.dart';

class ImportProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _guests = [];

  List<Map<String, dynamic>> _filteredGuests = [];
  String selectedfarm = 'Kannur';

  // List of items in the dropdown
  final List<String> farms = [
    'Kozhikod',
    'Kannur',
    'Kasargod',
    'karnataka',
  ];

  PayrollProvider() {
    _filteredGuests = List.from(_guests);
  }

  List<Map<String, dynamic>> get guests => _filteredGuests;

  void filterByFarm(String filter) {
    if (filter == 'All') {
      _filteredGuests = _guests;
    } else {
      _filteredGuests =
          _guests.where((guest) => guest[selectedfarm] == filter).toList();
    }
    notifyListeners();
  }

  void addImportDetails(Map<String, dynamic> newDetails) {
    _guests.add(newDetails);
    _filteredGuests = List.from(_guests);
    notifyListeners();
  }

  //Checkbox
  final List<Map<String, dynamic>> bookings = [];
  String _selectedSortOption = '';

  List<Map<String, dynamic>> get _bookings => bookings;
  String get selectedSortOption => _selectedSortOption;

  void filterbookings(String status) {
    _selectedSortOption = status;
    // Implement the filtering logic based on the status
    // For example:
    // _guests = _guests.where((guest) => guest['status'] == status).toList();
    notifyListeners();
  }
}
