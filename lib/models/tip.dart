enum TipCategory { health, mentalHealth, prevention, lifestyle }

class Tip {
  final String id;
  final String title;
  final String content;
  final TipCategory? category;
  final bool isActive;
  final DateTime createdAt;

  Tip({
    required this.id,
    required this.title,
    required this.content,
    this.category,
    this.isActive = true,
    required this.createdAt,
  });

  factory Tip.fromJson(Map<String, dynamic> json) {
    return Tip(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      content: json['content'] ?? '',
      category: json['category'] != null 
          ? TipCategory.values.firstWhere(
              (e) => e.name.toLowerCase() == json['category'].toString().toLowerCase()
            )
          : null,
      isActive: json['isActive'] ?? true,
      createdAt: json['createdAt'] != null 
          ? DateTime.parse(json['createdAt']) 
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'category': category?.name.toUpperCase(),
      'isActive': isActive,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
