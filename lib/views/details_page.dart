import 'package:flutter/material.dart';
import '../models/company.dart';
import '../services/fetchData.dart'; // Import your DataFetcher class

class DetailsPage extends StatefulWidget {
  final String companyNumber;

  DetailsPage({required this.companyNumber});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late Future<Entity> entityData;

  @override

  void initState() {
    print(widget.companyNumber);
    super.initState();
    entityData = DataFetcher.fetchData(
        'https://data.brreg.no/enhetsregisteret/api/enheter/$widget.companyNumber');
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
        child: FutureBuilder<Entity>(
          future: entityData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              final entity = snapshot.data!;
              return const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "hello",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Add other details as needed
                ],
              );
            }
          },
        ),
      ),
    );
  }
}