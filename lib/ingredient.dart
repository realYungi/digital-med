class Ingredient{
  final int id;
  final String name;
  final String description;
  final String overdoseEffect;
  final String sideEffect;
  
  const Ingredient({
    required this.id,
    required this.name,
    required this.description,
    required this.overdoseEffect,
    required this.sideEffect,
  });
  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      overdoseEffect: json['overdoseEffect'],
      sideEffect: json['sideEffect'],
    );
  }
}
