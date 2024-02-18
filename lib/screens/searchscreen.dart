import 'package:flutter/material.dart';

class MedicineSearchScreen extends StatefulWidget {
  @override
  _MedicineSearchScreenState createState() => _MedicineSearchScreenState();
}

class _MedicineSearchScreenState extends State<MedicineSearchScreen> {
  String _searchQuery = '';
  bool _showResults = false;

  // Dummy data for demonstration
  final List<Map<String, dynamic>> _dummyMedicineData = [
    {
      'name': 'Aspirin',
      'description': 'Aspirin is a commonly used pain reliever and anti-inflammatory medication.',
      'ingredients': [
        'Acetylsalicylic Acid',
      ],
      'interaction': [
        {
          'severity': 'Moderate',
          'description': 'Combining aspirin and paracetamol may increase the risk of gastrointestinal bleeding.',
        },
      ],
    },
    {
      'name': 'Paracetamol',
      'description': 'Paracetamol, also known as acetaminophen, is a commonly used pain reliever and fever reducer.',
      'ingredients': [
        'Paracetamol',
      ],
      'interaction': [
        {
          'severity': 'Minor',
          'description': 'Combining paracetamol and ibuprofen may potentiate the analgesic effects.',
        },
      ],
    },
    // Add more medicine data as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medicine Interaction'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Search for Medicine',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            TextField(
              onChanged: (value) {
                setState(() {
                  _searchQuery = value.toLowerCase();
                  _showResults = _searchQuery.isNotEmpty;
                });
              },
              decoration: InputDecoration(
                hintText: 'Enter medicine name',
                prefixIcon: Icon(Icons.search),
              ),
            ),
            SizedBox(height: 20),
            _showResults
                ? Expanded(
                    child: ListView.builder(
                      itemCount: _dummyMedicineData.length,
                      itemBuilder: (context, index) {
                        final medicine = _dummyMedicineData[index];
                        final name = medicine['name'].toString().toLowerCase();

                        // Filter medicine data based on search query
                        if (!name.contains(_searchQuery)) {
                          return SizedBox.shrink(); // Hide if not matched
                        }

                        return MedicineCard(
                          name: medicine['name'],
                          description: medicine['description'],
                          ingredients: medicine['ingredients'],
                          interactions: medicine['interaction'],
                        );
                      },
                    ),
                  )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}

class MedicineCard extends StatelessWidget {
  final String name;
  final String description;
  final List<String> ingredients;
  final List<Map<String, String>> interactions;

  const MedicineCard({
    required this.name,
    required this.description,
    required this.ingredients,
    required this.interactions,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(description),
            SizedBox(height: 8),
            Text(
              'Ingredients: ${ingredients.join(", ")}',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 8),
            Text(
              'Interactions:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: interactions.map((interaction) {
                return Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Severity: ${interaction['severity']}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(interaction['description']),
                      SizedBox(height: 4),
                      Text(
                        'Management Recommendations: ${interaction['management_recommendations']}',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}