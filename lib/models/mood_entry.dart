enum MoodLevel { excellent, good, neutral, bad, worst }

class MoodEntry {
  final String id;
  final String userId;
  final DateTime entryDate;
  final MoodLevel moodLevel;
  final String? notes;
  final int? stressLevel; // 1-10 scale
  final int? sleepQuality; // 1-10 scale
  final DateTime createdAt;

  MoodEntry({
    required this.id,
    required this.userId,
    required this.entryDate,
    required this.moodLevel,
    this.notes,
    this.stressLevel,
    this.sleepQuality,
    required this.createdAt,
  });

  factory MoodEntry.fromJson(Map<String, dynamic> json) {
    return MoodEntry(
      id: json['id'] ?? '',
      userId: json['userId'] ?? '',
      entryDate: DateTime.parse(json['entryDate']),
      moodLevel: MoodLevel.values.firstWhere(
        (e) => e.name.toLowerCase() == json['moodLevel'].toString().toLowerCase()
      ),
      notes: json['notes'],
      stressLevel: json['stressLevel'],
      sleepQuality: json['sleepQuality'],
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
      'moodLevel': moodLevel.name.toUpperCase(),
      'notes': notes,
      'stressLevel': stressLevel,
      'sleepQuality': sleepQuality,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
