enum ReminderType { bedtimeRoutine, bathroomVisit, drinkLimit, medication, custom }

class Reminder {
  final String id;
  final String userId;
  final String title;
  final String? message;
  final DateTime reminderTime;
  final ReminderType? type;
  final bool isActive;
  final DateTime createdAt;

  Reminder({
    required this.id,
    required this.userId,
    required this.title,
    this.message,
    required this.reminderTime,
    this.type,
    this.isActive = true,
    required this.createdAt,
  });

  factory Reminder.fromJson(Map<String, dynamic> json) {
    return Reminder(
      id: json['id'] ?? '',
      userId: json['userId'] ?? '',
      title: json['title'] ?? '',
      message: json['message'],
      reminderTime: DateTime.parse(json['reminderTime']),
      type: json['type'] != null 
          ? ReminderType.values.firstWhere(
              (e) => e.name.toLowerCase() == json['type'].toString().toLowerCase()
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
      'userId': userId,
      'title': title,
      'message': message,
      'reminderTime': reminderTime.toIso8601String(),
      'type': type?.name.toUpperCase(),
      'isActive': isActive,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
