import 'package:flutter/material.dart';
import 'package:flutterproj/services/fetchData.dart';
import '../models/company.dart';
import 'details_page.dart'; // Import the details page

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<EntityData> entities = [];
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    fetchData(); // Fetch data when the app starts
  }

  Future<void> fetchData() async {
    try {
      final entity = await DataFetcher.fetchData(
          'https://data.brreg.no/enhetsregisteret/api/enheter?navn=Giant%20Leap%20Technologies');
      setState(() {
        entities = entity.entities;
      });
    } catch (e) {
      print("Error: $e");
      // Handle the error gracefully, e.g., show an error message to the user.
    }
  }

  // Function to navigate to the details page when an item is tapped
  void _navigateToDetails(EntityData entity) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => DetailsPage(entity: entity), // Pass the entity data to the details page
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Brønnøysundregistrene'),
        backgroundColor: const Color(0xff152D3F),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const SizedBox(
              height: 10.0,
            ),
            TextField(
              onChanged: (value) {
                // Implement search functionality here
                setState(() {
                  searchQuery = value;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Søk etter enheter',
                suffixIcon: Icon(Icons.search),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: entities.length,
                itemBuilder: (context, index) {
                  final entity = entities[index];
                  if (searchQuery.isNotEmpty &&
                      !entity.name
                          .toLowerCase()
                          .contains(searchQuery.toLowerCase())) {
                    // Skip items that don't match the search query
                    return const SizedBox.shrink();
                  }
                  return Card(
                    color: const Color(0xff152D3F),
                    elevation: 4,
                    child: GestureDetector(
                      onTap: () {
                        _navigateToDetails(entity); // Navigate to details page
                      },
                      child: ListTile(
                        title: Text(
                          entity.name,
                          style: const TextStyle(fontSize: 18.0, color: Colors.white),
                        ),
                        subtitle: Text(
                          entity.organisasjonsnummer,
                          style: const TextStyle(
                            fontSize: 15.0,
                            color: Colors.white,
                            height: 2.0,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
