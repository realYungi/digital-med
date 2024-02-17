class Medicine {
  final String name;
  final String description;
  final DateTime date;

  const Medicine({
    required this.name,
    required this.description,
    required this.date,
  });

  Map<String, dynamic> toJson() => {
    'name': name,
    'description': description,
    'date': date.toString(), // Convert date to string for storage
  };

  factory Medicine.fromJson(Map<String, dynamic> json) => Medicine(
    name: json['name'] as String,
    description: json['description'] as String,
    date: DateTime.parse(json['date'] as String), // Convert string back to date
  );
}
