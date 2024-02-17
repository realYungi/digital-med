import 'ingredient.dart';

class Medicine {
  final int id;
  final String name;
  final String description;
  final DateTime createdAt; // Time medicine was added
  final List<Ingredient> ingredients;

  const Medicine({
    required this.id,
    required this.name,
    required this.description,
    required this.createdAt,
    required this.ingredients,
  });
  
  factory Medicine.fromJson(Map<String, dynamic> json) {
    var ingredientsList = json['ingredients'] as List;
    List<Ingredient> ingredients =
        ingredientsList.map((i) => Ingredient.fromJson(i)).toList();

    return Medicine(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      createdAt: DateTime.now(),
      ingredients: ingredients,
    );
  }
}

