class DrinkEntry {
  final String id;
  final String userId;
  final DateTime entryDate;
  final DateTime timeConsumed;
  final String drinkType;
  final int? quantity; // in ml
  final String? notes;
  final DateTime createdAt;

  DrinkEntry({
    required this.id,
    required this.userId,
    required this.entryDate,
    required this.timeConsumed,
    required this.drinkType,
    this.quantity,
    this.notes,
    required this.createdAt,
  });

  factory DrinkEntry.fromJson(Map<String, dynamic> json) {
    return DrinkEntry(
      id: json['id'] ?? '',
      userId: json['userId'] ?? '',
      entryDate: DateTime.parse(json['entryDate']),
      timeConsumed: DateTime.parse(json['timeConsumed']),
      drinkType: json['drinkType'] ?? '',
      quantity: json['quantity'],
      notes: json['notes'],
      createdAt: json['createdAt'] != null 
          ? DateTime.parse(json['createdAt']) 
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'entryDate': entryDate.toIso8601String().split('T')[0],
      'timeConsumed': timeConsumed.toIso8601String(),
      'drinkType': drinkType,
      'quantity': quantity,
      'notes': notes,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
