import 'package:flutter/material.dart';
import '../../models/mood_entry.dart';
import '../../services/mock_data_service.dart';
import '../../config/theme.dart';
import 'package:intl/intl.dart';

class MoodTrackerScreen extends StatefulWidget {
  const MoodTrackerScreen({super.key});

  @override
  State<MoodTrackerScreen> createState() => _MoodTrackerScreenState();
}

class _MoodTrackerScreenState extends State<MoodTrackerScreen> {
  final MockDataService _mockService = MockDataService();

  @override
  Widget build(BuildContext context) {
    final entries = _mockService.getMoodEntries();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mood Tracker'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _addMoodEntry,
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: entries.length,
        itemBuilder: (context, index) {
          final entry = entries[index];
          return _buildMoodCard(entry);
        },
      ),
    );
  }

  Widget _buildMoodCard(MoodEntry entry) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  _getMoodIcon(entry.moodLevel),
                  color: AppTheme.getMoodColor(entry.moodLevel.name),
                  size: 32,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        DateFormat('MMM d, y').format(entry.entryDate),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        entry.moodLevel.name.toUpperCase(),
                        style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.getMoodColor(entry.moodLevel.name),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (entry.stressLevel != null || entry.sleepQuality != null) ...[
              const SizedBox(height: 12),
              Row(
                children: [
                  if (entry.stressLevel != null)
                    Expanded(
                      child: _buildMetric('Stress', entry.stressLevel!, Icons.psychology),
                    ),
                  if (entry.sleepQuality != null)
                    Expanded(
                      child: _buildMetric('Sleep', entry.sleepQuality!, Icons.bedtime),
                    ),
                ],
              ),
            ],
            if (entry.notes != null && entry.notes!.isNotEmpty) ...[
              const SizedBox(height: 12),
              Text(
                entry.notes!,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildMetric(String label, int value, IconData icon) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey[600]),
        const SizedBox(width: 4),
        Text(
          '$label: $value/10',
          style: TextStyle(
            fontSize: 13,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  IconData _getMoodIcon(MoodLevel mood) {
    switch (mood) {
      case MoodLevel.excellent:
        return Icons.sentiment_very_satisfied;
      case MoodLevel.good:
        return Icons.sentiment_satisfied;
      case MoodLevel.neutral:
        return Icons.sentiment_neutral;
      case MoodLevel.bad:
        return Icons.sentiment_dissatisfied;
      case MoodLevel.worst:
        return Icons.sentiment_very_dissatisfied;
    }
  }

  void _addMoodEntry() {
    // TODO: Show dialog to add mood entry
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Add mood entry coming soon!')),
    );
  }
}
