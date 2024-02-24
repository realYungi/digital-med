import 'package:flutter/material.dart';

class MedicineSearchScreen extends StatefulWidget {
  const MedicineSearchScreen({super.key});

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
        title: const Text('Medicine Interaction'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Search for Medicine',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              onChanged: (value) {
                setState(() {
                  _searchQuery = value.toLowerCase();
                  _showResults = _searchQuery.isNotEmpty;
                });
              },
              decoration: const InputDecoration(
                hintText: 'Enter medicine name',
                prefixIcon: Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 20),
            _showResults
                ? Expanded(
                    child: ListView.builder(
                      itemCount: _dummyMedicineData.length,
                      itemBuilder: (context, index) {
                        final medicine = _dummyMedicineData[index];
                        final name = medicine['name'].toString().toLowerCase();

                        // Filter medicine data based on search query
                        if (!name.contains(_searchQuery)) {
                          return const SizedBox.shrink(); // Hide if not matched
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
                : const SizedBox.shrink(),
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

  const MedicineCard({super.key, 
    required this.name,
    required this.description,
    required this.ingredients,
    required this.interactions,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(description),
            const SizedBox(height: 8),
            Text(
              'Ingredients: ${ingredients.join(", ")}',
              style: const TextStyle(fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 8),
            const Text(
              'Interactions:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: interactions.map((interaction) {
                return Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Severity: ${interaction['severity']}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(interaction['description']!),
                      const SizedBox(height: 4),
                      Text(
                        'Management Recommendations: ${interaction['management_recommendations']}',
                        style: const TextStyle(fontStyle: FontStyle.italic),
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