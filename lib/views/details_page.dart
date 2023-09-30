import 'package:flutter/material.dart';
import '../models/company.dart';
import '../services/fetchData.dart';

class DetailsPage extends StatelessWidget {
  final EntityData entity;

  DetailsPage({required this.entity});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details Page'),
        backgroundColor: const Color(0xff152D3F),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Entity Name:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              entity.name,
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 10.0),
            const Text(
              'Organisasjonsnummer:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              entity.organisasjonsnummer,
              style: TextStyle(fontSize: 16.0),
            ),
            // Add more Text widgets for additional information
          ],
        ),
      ),
    );
  }
}
