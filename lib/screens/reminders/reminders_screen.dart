import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/reminder.dart';
import '../../services/mock_data_service.dart';
import '../../config/theme.dart';

class RemindersScreen extends StatefulWidget {
  const RemindersScreen({super.key});

  @override
  State<RemindersScreen> createState() => _RemindersScreenState();
}

class _RemindersScreenState extends State<RemindersScreen> {
  final MockDataService _mockService = MockDataService();

  @override
  Widget build(BuildContext context) {
    final reminders = _mockService.getReminders();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Reminders'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // TODO: Add reminder
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: reminders.length,
        itemBuilder: (context, index) {
          final reminder = reminders[index];
          return _buildReminderCard(reminder);
        },
      ),
    );
  }

  Widget _buildReminderCard(Reminder reminder) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: reminder.isActive 
                ? AppTheme.primaryColor.withOpacity(0.1)
                : Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            _getReminderIcon(reminder.type),
            color: reminder.isActive ? AppTheme.primaryColor : Colors.grey,
          ),
        ),
        title: Text(
          reminder.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (reminder.message != null)
              Text(reminder.message!),
            const SizedBox(height: 4),
            Text(
              DateFormat('h:mm a').format(reminder.reminderTime),
              style: const TextStyle(
                color: AppTheme.primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        trailing: Switch(
          value: reminder.isActive,
          onChanged: (value) {
            // TODO: Toggle reminder
          },
          activeColor: AppTheme.primaryColor,
        ),
      ),
    );
  }

  IconData _getReminderIcon(ReminderType? type) {
    if (type == null) return Icons.notifications;
    
    switch (type) {
      case ReminderType.bedtimeRoutine:
        return Icons.bedtime;
      case ReminderType.bathroomVisit:
        return Icons.wc;
      case ReminderType.drinkLimit:
        return Icons.local_drink;
      case ReminderType.medication:
        return Icons.medication;
      case ReminderType.custom:
        return Icons.notifications;
    }
  }
}
