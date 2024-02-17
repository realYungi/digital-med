import 'ingredient.dart';

class Medicine {
  final String name;
  final String description;
  final DateTime createdAt; // Time medicine was added
  final List<Ingredient> ingredients;

  const Medicine({
    required this.name,
    required this.description,
    required this.createdAt,
    required this.ingredients,
  });
}

