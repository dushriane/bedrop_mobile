import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import '../../models/bedwetting_entry.dart';
import '../../services/mock_data_service.dart';
import '../../config/theme.dart';
import 'add_bedwetting_entry_screen.dart';

class BedwettingListScreen extends StatefulWidget {
  const BedwettingListScreen({super.key});

  @override
  State<BedwettingListScreen> createState() => _BedwettingListScreenState();
}

class _BedwettingListScreenState extends State<BedwettingListScreen> {
  final MockDataService _mockService = MockDataService();
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final entries = _mockService.getBedwettingEntries();
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bedwetting Log'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AddBedwettingEntryScreen()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          _buildCalendar(entries),
          Expanded(
            child: _buildEntriesList(entries),
          ),
        ],
      ),
    );
  }

  Widget _buildCalendar(List<BedwettingEntry> entries) {
    return Container(
      color: Colors.white,
      child: TableCalendar(
        firstDay: DateTime.now().subtract(const Duration(days: 365)),
        lastDay: DateTime.now().add(const Duration(days: 365)),
        focusedDay: _focusedDay,
        selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
          });
        },
        calendarStyle: CalendarStyle(
          markerDecoration: const BoxDecoration(
            color: AppTheme.errorColor,
            shape: BoxShape.circle,
          ),
          selectedDecoration: BoxDecoration(
            color: AppTheme.primaryColor,
            shape: BoxShape.circle,
          ),
          todayDecoration: BoxDecoration(
            color: AppTheme.primaryColor.withOpacity(0.3),
            shape: BoxShape.circle,
          ),
        ),
        eventLoader: (day) {
          return entries
              .where((e) => isSameDay(e.incidentDate, day))
              .toList();
        },
      ),
    );
  }

  Widget _buildEntriesList(List<BedwettingEntry> entries) {
    final selectedDayEntries = entries
        .where((e) => isSameDay(e.incidentDate, _selectedDay))
        .toList();

    if (selectedDayEntries.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle_outline,
              size: 64,
              color: AppTheme.successColor.withOpacity(0.5),
            ),
            const SizedBox(height: 16),
            Text(
              'No entries for ${DateFormat('MMM d, y').format(_selectedDay)}',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'A dry night! 🎉',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: selectedDayEntries.length,
      itemBuilder: (context, index) {
        final entry = selectedDayEntries[index];
        return _buildEntryCard(entry);
      },
    );
  }

  Widget _buildEntryCard(BedwettingEntry entry) {
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
                  Icons.water_drop,
                  color: AppTheme.getQuantityColor(entry.quantity?.name ?? 'medium'),
                ),
                const SizedBox(width: 8),
                Text(
                  DateFormat('MMM d, y').format(entry.incidentDate),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            if (entry.approximateTime != null)
              _buildInfoRow('Time', DateFormat('h:mm a').format(entry.approximateTime!)),
            if (entry.quantity != null)
              _buildInfoRow('Quantity', entry.quantity!.name.toUpperCase()),
            if (entry.wakeUpFeeling != null)
              _buildInfoRow('Wake Up Feeling', entry.wakeUpFeeling!.name.toUpperCase()),
            if (entry.notes != null && entry.notes!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  entry.notes!,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
