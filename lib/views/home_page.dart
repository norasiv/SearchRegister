import 'package:flutter/material.dart';
import 'package:flutterproj/services/fetchData.dart';
import '../models/company.dart';
import 'details_page.dart';

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
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final entity = await DataFetcher.fetchData<Entity>(
        'https://data.brreg.no/enhetsregisteret/api/enheter?navn=aboveit',
            (json) => Entity.fromJson(json), // Use Entity.fromJson to parse the JSON
      );
      setState(() {
        entities = entity.entities; // Update the entities list with the fetched data
      });
    } catch (e) {
      print("Error: $e");
    }
  }



  // Function to navigate to the details page when an item is tapped
  void _navigateToDetails(EntityData entity) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => DetailsPage(
          companyNumber: entity.number, // Pass organisasjonsnummer
        ),
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
                          entity.number,
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
