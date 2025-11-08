import '../models/bedwetting_entry.dart';
import '../models/drink_entry.dart';
import '../models/goal.dart';
import '../models/mood_entry.dart';
import '../models/reminder.dart';
import '../models/tip.dart';
import '../models/user_profile.dart';

class MockDataService {
  static final MockDataService _instance = MockDataService._internal();
  factory MockDataService() => _instance;
  MockDataService._internal();

  // Mock User Profile
  static final UserProfile mockUser = UserProfile(
    id: 'user_001',
    username: 'alex_journey',
    email: 'alex@example.com',
    firstName: 'Alex',
    lastName: 'Thompson',
    dateOfBirth: DateTime(2010, 5, 15),
    gender: 'Male',
    weight: 45,
    height: 150,
  );

  // Mock Bedwetting Entries
  static final List<BedwettingEntry> mockBedwettingEntries = [
    BedwettingEntry(
      id: 'bw_001',
      userId: 'user_001',
      incidentDate: DateTime.now().subtract(const Duration(days: 1)),
      approximateTime: DateTime.now().subtract(const Duration(days: 1, hours: 18)),
      sleepTime: DateTime.now().subtract(const Duration(days: 1, hours: 14)),
      wakeTime: DateTime.now().subtract(const Duration(days: 1, hours: 6)),
      quantity: UrineQuantity.medium,
      smell: SmellLevel.low,
      wakeUpFeeling: MoodLevel.neutral,
      bedtimeFeeling: MoodLevel.good,
      notes: 'Drank water before bed',
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
    ),
    BedwettingEntry(
      id: 'bw_002',
      userId: 'user_001',
      incidentDate: DateTime.now().subtract(const Duration(days: 3)),
      approximateTime: DateTime.now().subtract(const Duration(days: 3, hours: 19)),
      sleepTime: DateTime.now().subtract(const Duration(days: 3, hours: 14)),
      wakeTime: DateTime.now().subtract(const Duration(days: 3, hours: 7)),
      quantity: UrineQuantity.high,
      smell: SmellLevel.tooMuch,
      wakeUpFeeling: MoodLevel.bad,
      bedtimeFeeling: MoodLevel.excellent,
      notes: 'Had soda at dinner',
      createdAt: DateTime.now().subtract(const Duration(days: 3)),
    ),
    BedwettingEntry(
      id: 'bw_003',
      userId: 'user_001',
      incidentDate: DateTime.now().subtract(const Duration(days: 7)),
      approximateTime: DateTime.now().subtract(const Duration(days: 7, hours: 20)),
      sleepTime: DateTime.now().subtract(const Duration(days: 7, hours: 13)),
      wakeTime: DateTime.now().subtract(const Duration(days: 7, hours: 7)),
      quantity: UrineQuantity.low,
      smell: SmellLevel.noSmell,
      wakeUpFeeling: MoodLevel.good,
      bedtimeFeeling: MoodLevel.neutral,
      createdAt: DateTime.now().subtract(const Duration(days: 7)),
    ),
  ];

  // Mock Drink Entries
  static final List<DrinkEntry> mockDrinkEntries = [
    DrinkEntry(
      id: 'drink_001',
      userId: 'user_001',
      entryDate: DateTime.now(),
      timeConsumed: DateTime.now().subtract(const Duration(hours: 1)),
      drinkType: 'Water',
      quantity: 250,
      notes: 'Morning hydration',
      createdAt: DateTime.now(),
    ),
    DrinkEntry(
      id: 'drink_002',
      userId: 'user_001',
      entryDate: DateTime.now(),
      timeConsumed: DateTime.now().subtract(const Duration(hours: 3)),
      drinkType: 'Orange Juice',
      quantity: 200,
      createdAt: DateTime.now(),
    ),
    DrinkEntry(
      id: 'drink_003',
      userId: 'user_001',
      entryDate: DateTime.now().subtract(const Duration(days: 1)),
      timeConsumed: DateTime.now().subtract(const Duration(days: 1, hours: 5)),
      drinkType: 'Milk',
      quantity: 300,
      notes: 'With breakfast',
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
    ),
    DrinkEntry(
      id: 'drink_004',
      userId: 'user_001',
      entryDate: DateTime.now().subtract(const Duration(days: 1)),
      timeConsumed: DateTime.now().subtract(const Duration(days: 1, hours: 10)),
      drinkType: 'Water',
      quantity: 250,
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
    ),
  ];

  // Mock Goals
  static final List<Goal> mockGoals = [
    Goal(
      id: 'goal_001',
      userId: 'user_001',
      title: '7 Dry Nights Challenge',
      description: 'Achieve 7 consecutive dry nights to build confidence',
      targetDays: 7,
      currentStreak: 4,
      bestStreak: 5,
      status: GoalStatus.active,
      startDate: DateTime.now().subtract(const Duration(days: 10)),
      targetDate: DateTime.now().add(const Duration(days: 4)),
      createdAt: DateTime.now().subtract(const Duration(days: 10)),
    ),
    Goal(
      id: 'goal_002',
      userId: 'user_001',
      title: '30 Day Journey',
      description: 'Long term goal for consistent progress',
      targetDays: 30,
      currentStreak: 12,
      bestStreak: 12,
      status: GoalStatus.active,
      startDate: DateTime.now().subtract(const Duration(days: 20)),
      targetDate: DateTime.now().add(const Duration(days: 40)),
      createdAt: DateTime.now().subtract(const Duration(days: 20)),
    ),
    Goal(
      id: 'goal_003',
      userId: 'user_001',
      title: 'Weekend Success',
      description: 'Stay dry for the whole weekend',
      targetDays: 2,
      currentStreak: 2,
      bestStreak: 2,
      status: GoalStatus.completed,
      startDate: DateTime.now().subtract(const Duration(days: 30)),
      targetDate: DateTime.now().subtract(const Duration(days: 28)),
      completedDate: DateTime.now().subtract(const Duration(days: 28)),
      createdAt: DateTime.now().subtract(const Duration(days: 30)),
    ),
  ];

  // Mock Mood Entries
  static final List<MoodEntry> mockMoodEntries = [
    MoodEntry(
      id: 'mood_001',
      userId: 'user_001',
      entryDate: DateTime.now(),
      moodLevel: MoodLevel.good,
      notes: 'Feeling positive today!',
      stressLevel: 3,
      sleepQuality: 8,
      createdAt: DateTime.now(),
    ),
    MoodEntry(
      id: 'mood_002',
      userId: 'user_001',
      entryDate: DateTime.now().subtract(const Duration(days: 1)),
      moodLevel: MoodLevel.excellent,
      notes: 'Had a great day at school',
      stressLevel: 2,
      sleepQuality: 9,
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
    ),
    MoodEntry(
      id: 'mood_003',
      userId: 'user_001',
      entryDate: DateTime.now().subtract(const Duration(days: 2)),
      moodLevel: MoodLevel.neutral,
      stressLevel: 5,
      sleepQuality: 6,
      createdAt: DateTime.now().subtract(const Duration(days: 2)),
    ),
  ];

  // Mock Reminders
  static final List<Reminder> mockReminders = [
    Reminder(
      id: 'rem_001',
      userId: 'user_001',
      title: 'Bedtime Bathroom Visit',
      message: 'Remember to use the bathroom before going to bed',
      reminderTime: DateTime(2024, 1, 1, 21, 0),
      type: ReminderType.bathroomVisit,
      isActive: true,
      createdAt: DateTime.now().subtract(const Duration(days: 5)),
    ),
    Reminder(
      id: 'rem_002',
      userId: 'user_001',
      title: 'Limit Evening Drinks',
      message: 'Try to reduce liquid intake after 7 PM',
      reminderTime: DateTime(2024, 1, 1, 19, 0),
      type: ReminderType.drinkLimit,
      isActive: true,
      createdAt: DateTime.now().subtract(const Duration(days: 5)),
    ),
    Reminder(
      id: 'rem_003',
      userId: 'user_001',
      title: 'Start Bedtime Routine',
      message: 'Time to start winding down for the night',
      reminderTime: DateTime(2024, 1, 1, 20, 30),
      type: ReminderType.bedtimeRoutine,
      isActive: true,
      createdAt: DateTime.now().subtract(const Duration(days: 5)),
    ),
  ];

  // Mock Tips
  static final List<Tip> mockTips = [
    Tip(
      id: 'tip_001',
      title: 'Stay Hydrated During the Day',
      content: 'Drinking plenty of water during the day helps train your bladder. Just remember to reduce intake 2-3 hours before bedtime.',
      category: TipCategory.health,
      createdAt: DateTime.now(),
    ),
    Tip(
      id: 'tip_002',
      title: 'Establish a Bedtime Routine',
      content: 'Create a consistent routine that includes using the bathroom before bed. This helps signal your body that it\'s time to sleep.',
      category: TipCategory.lifestyle,
      createdAt: DateTime.now(),
    ),
    Tip(
      id: 'tip_003',
      title: 'Positive Reinforcement Works',
      content: 'Celebrate dry nights and progress, no matter how small. Positive encouragement is more effective than punishment or shame.',
      category: TipCategory.mentalHealth,
      createdAt: DateTime.now(),
    ),
    Tip(
      id: 'tip_004',
      title: 'Avoid Caffeine and Sugary Drinks',
      content: 'Caffeine and sugar can irritate the bladder and increase urine production. Stick to water and avoid soda or chocolate before bed.',
      category: TipCategory.prevention,
      createdAt: DateTime.now(),
    ),
    Tip(
      id: 'tip_005',
      title: 'Keep a Tracking Journal',
      content: 'Recording patterns can help identify triggers and celebrate progress. This app makes it easy to track your journey!',
      category: TipCategory.lifestyle,
      createdAt: DateTime.now(),
    ),
  ];

  // Getters
  UserProfile getUser() => mockUser;
  List<BedwettingEntry> getBedwettingEntries() => List.from(mockBedwettingEntries);
  List<DrinkEntry> getDrinkEntries() => List.from(mockDrinkEntries);
  List<Goal> getGoals() => List.from(mockGoals);
  List<MoodEntry> getMoodEntries() => List.from(mockMoodEntries);
  List<Reminder> getReminders() => List.from(mockReminders);
  List<Tip> getTips() => List.from(mockTips);

  // Add entries (for testing)
  void addBedwettingEntry(BedwettingEntry entry) {
    mockBedwettingEntries.insert(0, entry);
  }

  void addDrinkEntry(DrinkEntry entry) {
    mockDrinkEntries.insert(0, entry);
  }

  void addGoal(Goal goal) {
    mockGoals.insert(0, goal);
  }

  void addMoodEntry(MoodEntry entry) {
    mockMoodEntries.insert(0, entry);
  }

  void addReminder(Reminder reminder) {
    mockReminders.insert(0, reminder);
  }
}
