# Quick Start Commands

## Installation & Setup

```powershell
# 1. Install dependencies
flutter pub get

# 2. Check for issues
flutter doctor

# 3. Run the app
flutter run
```

## File Management

### Option A: Rename files (backup old ones)
```powershell
# Backup and replace main.dart
Rename-Item lib\main.dart lib\main_backup.dart
Rename-Item lib\main_new.dart lib\main.dart

# Backup and replace user_dashboard.dart
Rename-Item lib\screens\dashboard\user_dashboard.dart lib\screens\dashboard\user_dashboard_backup.dart
Rename-Item lib\screens\dashboard\user_dashboard_new.dart lib\screens\dashboard\user_dashboard.dart
```

### Option B: Copy content manually
1. Open `lib/main_new.dart` and copy all content
2. Paste into `lib/main.dart`
3. Open `lib/screens/dashboard/user_dashboard_new.dart` and copy all content
4. Paste into `lib/screens/dashboard/user_dashboard.dart`

## Running the App

```powershell
# Run on connected device/emulator
flutter run

# Run in debug mode with hot reload
flutter run --debug

# Run on specific device
flutter devices  # List available devices
flutter run -d <device-id>

# Run on Chrome (web)
flutter run -d chrome
```

## Development Commands

```powershell
# Clean build files
flutter clean

# Rebuild
flutter pub get
flutter run

# Check for errors
flutter analyze

# Format code
flutter format lib/

# Create release build (Android)
flutter build apk

# Create release build (iOS)
flutter build ios
```

## Troubleshooting

```powershell
# If you get dependency errors
flutter clean
flutter pub get
flutter pub upgrade

# If hot reload stops working
# Press 'R' in terminal for full restart
# Press 'r' for hot reload

# Check Flutter installation
flutter doctor -v
```

## Quick Navigation

- **Main app**: `lib/main.dart` or `lib/main_new.dart`
- **Dashboard**: `lib/screens/dashboard/user_dashboard_new.dart`
- **Theme**: `lib/config/theme.dart`
- **Mock Data**: `lib/services/mock_data_service.dart`
- **Models**: `lib/models/`
- **Screens**: `lib/screens/`

## Testing Features

Once running, you can:
1. See dashboard with mock data
2. Tap bottom navigation to switch screens
3. Tap FAB (+) button to add bedwetting entry
4. View calendar with incident markers
5. See goals and progress
6. View mood entries
7. Check reminders

## Next Development Steps

1. ✅ Models created
2. ✅ Mock data service ready
3. ✅ Theme configured
4. ✅ Dashboard implemented
5. ✅ Entry screens created
6. ⏳ Complete drink entry form
7. ⏳ Add goal creation dialog
8. ⏳ Backend integration
9. ⏳ Authentication
10. ⏳ Push notifications
