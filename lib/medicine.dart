import 'ingredient.dart';

class Medicine {
  final int id;
  final String name;
  final String description;
  final DateTime dateTimeCreated; // New property for storing creation date and time
  final List<Ingredient> ingredients;
  bool isDone;

  const Medicine({
    required this.id,
    required this.name,
    required this.description,
    required this.dateTimeCreated,
    required this.ingredients,
    required this.isDone=false,
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

