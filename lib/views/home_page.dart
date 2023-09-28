import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterproj/services/fetchData.dart';
import 'package:http/http.dart' as http;

import '../models/company.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String entityName = ''; // Store the entity name here
  String entityNumber = ''; // Store the entityNumber here

  @override
  void initState() {
    super.initState();
    fetchData(); // Fetch data when the app starts
  }

  Future<void> fetchData() async {
    print("are you there?");
    try {
      final entity = await DataFetcher.fetchData('https://data.brreg.no/enhetsregisteret/api/enheter?navn=Giant%20Leap%20Technologies');
      setState(() {
        entityName = entity.name;
        entityNumber = entity.organisasjonsnummer;
      });
    } catch (e) {
      print("Error: $e");
      setState(() {
        entityName = 'Error: $e';
        entityNumber = 'Error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Entity Data'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Entity Name: $entityName',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 16.0), // Add some spacing
            Text(
              'Organisasjonsnummer: $entityNumber',
              style: TextStyle(fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }
}
