enum UrineQuantity { high, medium, low }
enum SmellLevel { tooMuch, low, noSmell }
enum MoodLevel { excellent, good, neutral, bad, worst }

class BedwettingEntry {
  final String id;
  final String userId;
  final DateTime incidentDate;
  final DateTime? approximateTime;
  final DateTime? sleepTime;
  final DateTime? wakeTime;
  final UrineQuantity? quantity;
  final SmellLevel? smell;
  final MoodLevel? wakeUpFeeling;
  final MoodLevel? bedtimeFeeling;
  final String? notes;
  final DateTime createdAt;

  BedwettingEntry({
    required this.id,
    required this.userId,
    required this.incidentDate,
    this.approximateTime,
    this.sleepTime,
    this.wakeTime,
    this.quantity,
    this.smell,
    this.wakeUpFeeling,
    this.bedtimeFeeling,
    this.notes,
    required this.createdAt,
  });

  factory BedwettingEntry.fromJson(Map<String, dynamic> json) {
    return BedwettingEntry(
      id: json['id'] ?? '',
      userId: json['userId'] ?? '',
      incidentDate: DateTime.parse(json['incidentDate']),
      approximateTime: json['approximateTime'] != null 
          ? DateTime.parse(json['approximateTime']) 
          : null,
      sleepTime: json['sleepTime'] != null 
          ? DateTime.parse(json['sleepTime']) 
          : null,
      wakeTime: json['wakeTime'] != null 
          ? DateTime.parse(json['wakeTime']) 
          : null,
      quantity: json['quantity'] != null 
          ? UrineQuantity.values.firstWhere(
              (e) => e.name.toLowerCase() == json['quantity'].toString().toLowerCase()
            )
          : null,
      smell: json['smell'] != null 
          ? SmellLevel.values.firstWhere(
              (e) => e.name.toLowerCase() == json['smell'].toString().toLowerCase()
            )
          : null,
      wakeUpFeeling: json['wakeUpFeeling'] != null 
          ? MoodLevel.values.firstWhere(
              (e) => e.name.toLowerCase() == json['wakeUpFeeling'].toString().toLowerCase()
            )
          : null,
      bedtimeFeeling: json['bedtimeFeeling'] != null 
          ? MoodLevel.values.firstWhere(
              (e) => e.name.toLowerCase() == json['bedtimeFeeling'].toString().toLowerCase()
            )
          : null,
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
      'incidentDate': incidentDate.toIso8601String().split('T')[0],
      'approximateTime': approximateTime?.toIso8601String(),
      'sleepTime': sleepTime?.toIso8601String(),
      'wakeTime': wakeTime?.toIso8601String(),
      'quantity': quantity?.name.toUpperCase(),
      'smell': smell?.name.toUpperCase(),
      'wakeUpFeeling': wakeUpFeeling?.name.toUpperCase(),
      'bedtimeFeeling': bedtimeFeeling?.name.toUpperCase(),
      'notes': notes,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
