import 'package:flutter/material.dart';
import '../models/company_details.dart';
import '../services/fetchData.dart';

class DetailsPage extends StatefulWidget {
  final String companyNumber;

  DetailsPage({required this.companyNumber});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  Future<CompanyDetails?>? companyDetails;

  @override
  void initState() {
    super.initState();
    companyDetails = fetchData();
  }

  Future<CompanyDetails?> fetchData() async {
    try {
      final details = await DataFetcher.fetchData<CompanyDetails>(
        'https://data.brreg.no/enhetsregisteret/api/enheter/${widget.companyNumber}',
            (json) => CompanyDetails.fromJson(json),
      );
      return details;
    } catch (e) {
      print("Error: $e");
      throw e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details Page'),
        backgroundColor: const Color(0xff152D3F),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FutureBuilder<CompanyDetails?>(
          future: companyDetails,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) { // Check if data is available
              final entity = snapshot.data!;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Entity Name: ${entity.hjemmeside}",
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Organisasjonsnummer: ${entity.organisasjonsnummer}",
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Add other details as needed
                ],
              );
            } else {
              return const Text('No data available.');
            }
          },
        ),
      ),
    );
  }
}
