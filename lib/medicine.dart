class Medicine {
  final String name;
  final String description;
  final DateTime dateTimeCreated; // New property for storing creation date and time
  bool isDone;

  Medicine({
    required this.name,
    required this.description,
    required this.dateTimeCreated,
    this.isDone = false,
  });
}