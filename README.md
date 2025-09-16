# Bedrop Mobile

Mobile frontend of bedrop - A Flutter mobile app with user and admin dashboards.

## Features

- **Authentication System**
  - User login and registration
  - Role-based access (User/Admin)
  - Persistent authentication state

- **User Dashboard**
  - Home page with quick actions
  - Profile management
  - Settings and preferences
  - File upload/download functionality (coming soon)

- **Admin Dashboard**
  - System overview with statistics
  - User management interface
  - System settings and maintenance
  - Security and analytics tools

## Getting Started

### Prerequisites

- Flutter SDK (>=3.0.0)
- Dart SDK
- Android Studio / VS Code
- Android device/emulator or iOS device/simulator

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/dushriane/bedrop_mobile.git
   cd bedrop_mobile
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Run the app:
   ```bash
   flutter run
   ```

### Testing

Run tests with:
```bash
flutter test
```

## Demo Instructions

The app includes demo authentication:

- **Admin Access**: Use any email containing "admin" (e.g., admin@example.com)
- **User Access**: Use any other email (e.g., user@example.com)
- **Password**: Any password with minimum 6 characters

## Project Structure

```
lib/
├── main.dart                 # App entry point
├── screens/
│   ├── auth/
│   │   ├── login_screen.dart
│   │   └── signup_screen.dart
│   └── dashboard/
│       ├── user_dashboard.dart
│       └── admin_dashboard.dart
├── services/
│   └── auth_service.dart     # Authentication logic
├── models/                   # Data models
├── widgets/                  # Reusable widgets
└── utils/                    # Utility functions
```

## Technologies Used

- **Flutter**: Cross-platform mobile framework
- **Provider**: State management
- **go_router**: Navigation and routing
- **shared_preferences**: Persistent storage
- **Material Design**: UI components

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

## License

This project is licensed under the MIT License.
