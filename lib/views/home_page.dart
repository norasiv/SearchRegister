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
  bool isLoading = false;
  bool searchPerformed = false;

  @override
  void initState() {
    super.initState();
  }

  //Fetches data with DataFetcher-class using searchQuery
  Future<void> fetchData() async {
    try {
      setState(() {
        isLoading = true;
      });
      final entity = await DataFetcher.fetchData<Entity>(
        'https://data.brreg.no/enhetsregisteret/api/enheter?navn=$searchQuery',
            (json) => Entity.fromJson(json),
      );
      setState(() {
        entities = entity.entities;
        isLoading = false;
      });
    } catch (e) {
      print("Error: $e");
      setState(() {
        isLoading = false;
        entities.clear();
      });
    }
  }


  void _navigateToDetails(EntityData entity) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            DetailsPage(
              companyNumber: entity.number,
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
                setState(() {
                  searchQuery = value;
                  if (searchQuery.isEmpty) {
                    entities.clear(); // Clear the entities list when searchQuery is empty
                    searchPerformed = false;
                  }
                });
              },
              onSubmitted: (value) {
                // Fetch when user hits enter
                searchPerformed = true;
                fetchData();
              },
              decoration: InputDecoration(
                labelText: 'Søk på bedrift',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    searchPerformed = true;
                    fetchData();
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            isLoading
                ? const Center(
              child: CircularProgressIndicator(),
            )
                : searchQuery.isEmpty
                ? const Center(

              child: Text(
                'Søk på bedrifter',
                style: TextStyle(fontSize: 18.0, color: Colors.black),
              ),
            )
                : searchPerformed && entities.isEmpty
        ? const Center(
              child: Text(
                'Ingen resultater',
                style:
                TextStyle(fontSize: 18.0, color: Colors.black),
              ),
            )
                : Expanded(
              child: ListView.builder(
                itemCount: entities.length,
                itemBuilder: (context, index) {
                  final entity = entities[index];
                  return Card(
                    color: const Color(0xff152D3F),
                    elevation: 4,
                    child: GestureDetector(
                      onTap: () {
                        _navigateToDetails(entity);
                      },
                      child: ListTile(
                        title: Text(
                          entity.name,
                          style: const TextStyle(
                            fontSize: 18.0,
                            color: Colors.white,
                          ),
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
