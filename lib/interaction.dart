class Interaction {
  final int id;
  final int ingredient1_id;
  final int ingredient2_id;
  final String severity;
  final String description;
  final String managementRecommendations;

  const Interaction({
    required this.id,
    required this.ingredient1_id,
    required this.ingredient2_id,
    required this.severity,
    required this.description,
    required this.managementRecommendations,
  });
}
