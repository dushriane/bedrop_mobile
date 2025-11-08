# Bedrop Mobile - Bedwetting Tracker App

A modern, feature-rich Flutter application for tracking and managing bedwetting incidents with a focus on positive reinforcement and progress tracking.

## Features

### Current Implementation

- **Dashboard** - Beautiful home screen with:
  - Personalized greetings
  - Quick stats (current streak, weekly progress)
  - Active goal tracking with progress visualization
  - Weekly progress chart
  - Quick action buttons
  - Daily tips

- **Bedwetting Logging** - Track incidents with:
  - Date and time tracking
  - Urine quantity levels
  - Smell levels
  - Mood tracking (bedtime and wake-up)
  - Sleep time tracking
  - Notes and observations
  - Calendar view

- **Goals** - Set and track progress goals:
  - Active and completed goals
  - Streak tracking (current and best)
  - Progress visualization
  - Target days setting

- **Mood Tracker** - Monitor emotional well-being:
  - Mood level tracking
  - Stress level (1-10 scale)
  - Sleep quality rating
  - Notes for context

- **Reminders** - Scheduled notifications for:
  - Bedtime routine
  - Bathroom visits
  - Drink limits
  - Medication
  - Custom reminders

- **Tips** - Helpful advice categorized by:
  - Health
  - Mental Health
  - Prevention
  - Lifestyle

## Technology Stack

- **Flutter SDK** - Latest stable version (3.0+)
- **State Management** - Provider
- **Routing** - Go Router 14.0
- **Charts** - FL Chart 0.66
- **Calendar** - Table Calendar 3.0.9
- **Fonts** - Google Fonts (Poppins)
- **Date Formatting** - Intl package

## Modern Design Features

- **Material 3** - Latest Material Design specifications
- **Vibrant Color Palette** - Appealing to all ages, especially younger users
- **Gradient Backgrounds** - Modern visual effects
- **Smooth Animations** - Enhanced user experience
- **Clean Cards** - Easy-to-read information display
- **Interactive Charts** - Visual progress tracking

## Color Scheme

- Primary: Vibrant Purple (#6C5CE7)
- Secondary: Mint Green (#00B894)
- Accent: Soft Pink (#FD79A8)
- Success: Green (#00B894)
- Warning: Warm Yellow (#FDCB6E)
- Error: Coral Red (#FF7675)

## Getting Started

### Prerequisites

- Flutter SDK (>=3.0.0)
- Dart SDK (included with Flutter)
- Android Studio / VS Code with Flutter extensions
- Git

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd bedrop_mobile
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### Testing with Mock Data

The app currently uses mock data for testing. The `MockDataService` provides:
- Sample user profile (Alex Thompson)
- Mock bedwetting entries (last 7 days)
- Sample drink entries
- Pre-configured goals
- Mood entries
- Active reminders
- Helpful tips

## Project Structure

```
lib/
├── config/
│   └── theme.dart                 # App theme and colors
├── models/
│   ├── bedwetting_entry.dart
│   ├── drink_entry.dart
│   ├── goal.dart
│   ├── mood_entry.dart
│   ├── reminder.dart
│   ├── tip.dart
│   └── user_profile.dart
├── screens/
│   ├── auth/
│   │   ├── login_screen.dart
│   │   └── signup_screen.dart
│   ├── dashboard/
│   │   └── user_dashboard_new.dart
│   ├── entries/
│   │   ├── bedwetting_list_screen.dart
│   │   ├── add_bedwetting_entry_screen.dart
│   │   ├── drink_list_screen.dart
│   │   └── add_drink_entry_screen.dart
│   ├── goals/
│   │   └── goals_screen.dart
│   ├── mood/
│   │   └── mood_tracker_screen.dart
│   └── reminders/
│       └── reminders_screen.dart
├── services/
│   ├── auth_service.dart
│   └── mock_data_service.dart
└── main_new.dart
```

## Models

All models are based on your backend structure:

### BedwettingEntry
- User reference
- Incident date and times
- Quantity, smell, mood levels
- Notes

### DrinkEntry
- User reference
- Date and time consumed
- Drink type and quantity (ml)
- Notes

### Goal
- User reference
- Title and description
- Target days and streaks
- Status tracking
- Dates

### MoodEntry
- User reference
- Mood level
- Stress and sleep ratings
- Notes

### Reminder
- User reference
- Title and message
- Reminder time and type
- Active status

### Tip
- Title and content
- Category
- Active status

### UserProfile
- Username and email
- Personal information
- Physical stats (optional)

## Future Enhancements

- [ ] Backend integration (replace mock data)
- [ ] User authentication
- [ ] Push notifications for reminders
- [ ] Data export (PDF reports)
- [ ] Charts and analytics
- [ ] Parent/Guardian dashboard
- [ ] Reward system
- [ ] Dark mode toggle
- [ ] Multi-language support
- [ ] Offline mode with sync

## Backend Integration

To integrate with your backend:

1. Update the models to match your API response format
2. Create API service classes in `lib/services/`
3. Replace `MockDataService` calls with real API calls
4. Implement proper error handling
5. Add loading states
6. Implement authentication flow

## Contributing

This is a private project. For any questions or contributions, please contact the development team.

## License

Proprietary - All rights reserved
