enum GoalStatus { active, completed, paused, cancelled }

class Goal {
  final String id;
  final String userId;
  final String title;
  final String? description;
  final int targetDays;
  final int currentStreak;
  final int bestStreak;
  final GoalStatus status;
  final DateTime startDate;
  final DateTime? targetDate;
  final DateTime? completedDate;
  final DateTime createdAt;

  Goal({
    required this.id,
    required this.userId,
    required this.title,
    this.description,
    required this.targetDays,
    this.currentStreak = 0,
    this.bestStreak = 0,
    this.status = GoalStatus.active,
    required this.startDate,
    this.targetDate,
    this.completedDate,
    required this.createdAt,
  });

  factory Goal.fromJson(Map<String, dynamic> json) {
    return Goal(
      id: json['id'] ?? '',
      userId: json['userId'] ?? '',
      title: json['title'] ?? '',
      description: json['description'],
      targetDays: json['targetDays'] ?? 0,
      currentStreak: json['currentStreak'] ?? 0,
      bestStreak: json['bestStreak'] ?? 0,
      status: json['status'] != null 
          ? GoalStatus.values.firstWhere(
              (e) => e.name.toLowerCase() == json['status'].toString().toLowerCase()
            )
          : GoalStatus.active,
      startDate: DateTime.parse(json['startDate']),
      targetDate: json['targetDate'] != null 
          ? DateTime.parse(json['targetDate']) 
          : null,
      completedDate: json['completedDate'] != null 
          ? DateTime.parse(json['completedDate']) 
          : null,
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
      'description': description,
      'targetDays': targetDays,
      'currentStreak': currentStreak,
      'bestStreak': bestStreak,
      'status': status.name.toUpperCase(),
      'startDate': startDate.toIso8601String().split('T')[0],
      'targetDate': targetDate?.toIso8601String().split('T')[0],
      'completedDate': completedDate?.toIso8601String().split('T')[0],
      'createdAt': createdAt.toIso8601String(),
    };
  }

  double get progress {
    if (targetDays == 0) return 0;
    return (currentStreak / targetDays).clamp(0.0, 1.0);
  }

  int get daysRemaining {
    return (targetDays - currentStreak).clamp(0, targetDays);
  }
}
