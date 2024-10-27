import 'package:bismi_chicken/main.dart';
import 'package:bismi_chicken/view_model.dart/import_provider.dart';
import 'package:bismi_chicken/widgets/custome_container.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChicksImport extends StatelessWidget {
  const ChicksImport({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final importProvider = Provider.of<ImportProvider>(context);
    return Expanded(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context, importProvider, height, width),
              SizedBox(height: height * 0.03),
              GuestsTable(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(context, importprovider, height, width) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'IMPORT DETAILS',
          style: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(width: width * 0.50),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildActionButton(
              context,
              'Sort',
              Icons.sort,
              Color.fromARGB(255, 219, 255, 160),
              () => _showSortOptions(context, importprovider),
            ),
            SizedBox(width: width * 0.01),
            buildActionButton(
              context,
              'Add',
              Icons.sort,
              Color.fromARGB(255, 160, 168, 255),
              () => _showSortOptions(context, importprovider),
            ),
            // _buildActionButton(
            //   context,
            //   'Booking',
            //   Icons.add,
            //   Color.fromARGB(255, 255, 160, 160),
            //   () => showDialog(
            //     context: context,
            //     builder: (context) => NewBookingDialog(),
            //   ),
            // ),
          ],
        ),
      ],
    );
  }

  Widget buildActionButton(BuildContext context, String label, IconData icon,
      Color color, VoidCallback onPressed) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextButton.icon(
        icon: Icon(icon, size: 12, color: Colors.black),
        label: Text(
          label,
          style: GoogleFonts.montserrat(
            fontSize: 11,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }

  void _showSortOptions(BuildContext context, bookingProvider) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Sort'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildSortOption(context, bookingProvider, 'Paid'),
              _buildSortOption(context, bookingProvider, 'Pending'),
              _buildSortOption(context, bookingProvider, 'All'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildSortOption(
      BuildContext context, bookingProvider, String status) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: custom_Container(
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: false,
        child: ListTile(
          leading: Checkbox(
            value: bookingProvider.selectedSortOption == status,
            onChanged: (bool? value) {
              if (value != null && value) {
                bookingProvider.filterGuests(status);
              }
              Navigator.pop(context);
            },
          ),
          title: Text(status),
          onTap: () {
            bookingProvider.filterGuests(status);
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

class GuestsTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final importProvider = Provider.of<ImportProvider>(context, listen: false);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: width * 0.770,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            offset: Offset(-0.3, 1),
            blurRadius: 2,
            spreadRadius: 0,
            color: Color.fromARGB(213, 216, 214, 214),
          ),
        ],
      ),
      child: DataTable(
        columns: _buildColumns(),
        rows: _buildRows(importProvider),
      ),
    );
  }

  List<DataColumn> _buildColumns() {
    return [
      DataColumn(
          label: Text('Farm', style: TextStyle(fontWeight: FontWeight.bold))),
      DataColumn(
          label:
              Text('BatchID', style: TextStyle(fontWeight: FontWeight.bold))),
      // DataColumn(
      //     label: Text('Room number',
      //         style: TextStyle(fontWeight: FontWeight.bold))),
      // DataColumn(
      //     label:
      //         Text('Check-in', style: TextStyle(fontWeight: FontWeight.bold))),
      // DataColumn(
      //     label:
      //         Text('Check-out', style: TextStyle(fontWeight: FontWeight.bold))),
      DataColumn(
          label:
              Text('Quantity', style: TextStyle(fontWeight: FontWeight.bold))),
      DataColumn(
          label: Text('Dead', style: TextStyle(fontWeight: FontWeight.bold))),
      DataColumn(
          label: Text('Date', style: TextStyle(fontWeight: FontWeight.bold))),
      // DataColumn(
      //     label:
      //         Text('Revenue', style: TextStyle(fontWeight: FontWeight.bold))),
    ];
  }

  List<DataRow> _buildRows(ImportProvider importprovider) {
    return importprovider.guests.map((guest) {
      print(guest);
      return DataRow(
        cells: [
          DataCell(Text(
            guest['Farm'],
            style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
          )),
          DataCell(Text('#${guest['BatchID']}',
              style: GoogleFonts.poppins(fontWeight: FontWeight.w500))),
          // DataCell(Text(guest['room'])),
          // DataCell(Text(guest['checkIn'])),
          // DataCell(Text(guest['checkOut'])),
          DataCell(Text(guest['Quantity'],
              style: GoogleFonts.poppins(fontWeight: FontWeight.w500))),
          DataCell(Text(guest['Dead'],
              style: GoogleFonts.poppins(fontWeight: FontWeight.w500))),
          DataCell(Text(guest['Date'],
              style: GoogleFonts.poppins(fontWeight: FontWeight.w500))),
          // DataCell(Container(
          //   padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
          //   decoration: BoxDecoration(
          //     color: _getStatusColor(guest['status']),
          //     borderRadius: BorderRadius.circular(4.0),
          //   ),
          //   child: Text(guest['status']),
          // )),
        ],
      );
    }).toList();
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case "Paid":
        return Color.fromARGB(255, 195, 255, 197);
      case "Waiting":
        return Color.fromARGB(255, 255, 209, 140);
      case "Pending":
        return Color.fromARGB(255, 255, 123, 114);
      default:
        return Color.fromARGB(255, 198, 194, 194);
    }
  }
}
