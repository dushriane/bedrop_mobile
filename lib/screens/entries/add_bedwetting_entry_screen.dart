import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/bedwetting_entry.dart';
import '../../services/mock_data_service.dart';
import '../../config/theme.dart';

class AddBedwettingEntryScreen extends StatefulWidget {
  const AddBedwettingEntryScreen({super.key});

  @override
  State<AddBedwettingEntryScreen> createState() => _AddBedwettingEntryScreenState();
}

class _AddBedwettingEntryScreenState extends State<AddBedwettingEntryScreen> {
  final _formKey = GlobalKey<FormState>();
  final MockDataService _mockService = MockDataService();
  
  DateTime _incidentDate = DateTime.now();
  TimeOfDay? _approximateTime;
  TimeOfDay? _sleepTime;
  TimeOfDay? _wakeTime;
  UrineQuantity? _quantity;
  SmellLevel? _smell;
  MoodLevel? _wakeUpFeeling;
  MoodLevel? _bedtimeFeeling;
  final TextEditingController _notesController = TextEditingController();

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log Bedwetting Entry'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _buildDatePicker(),
            const SizedBox(height: 20),
            _buildTimePickers(),
            const SizedBox(height: 20),
            _buildQuantitySelector(),
            const SizedBox(height: 20),
            _buildSmellSelector(),
            const SizedBox(height: 20),
            _buildMoodSelectors(),
            const SizedBox(height: 20),
            _buildNotesField(),
            const SizedBox(height: 24),
            _buildSaveButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildDatePicker() {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.calendar_today, color: AppTheme.primaryColor),
        title: const Text('Incident Date'),
        subtitle: Text(DateFormat('MMM d, y').format(_incidentDate)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () async {
          final date = await showDatePicker(
            context: context,
            initialDate: _incidentDate,
            firstDate: DateTime.now().subtract(const Duration(days: 365)),
            lastDate: DateTime.now(),
          );
          if (date != null) {
            setState(() => _incidentDate = date);
          }
        },
      ),
    );
  }

  Widget _buildTimePickers() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Times',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        _buildTimePickerTile(
          'Approximate Time',
          _approximateTime,
          (time) => setState(() => _approximateTime = time),
        ),
        const SizedBox(height: 8),
        _buildTimePickerTile(
          'Sleep Time',
          _sleepTime,
          (time) => setState(() => _sleepTime = time),
        ),
        const SizedBox(height: 8),
        _buildTimePickerTile(
          'Wake Time',
          _wakeTime,
          (time) => setState(() => _wakeTime = time),
        ),
      ],
    );
  }

  Widget _buildTimePickerTile(String label, TimeOfDay? time, Function(TimeOfDay) onSelect) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.access_time, color: AppTheme.primaryColor),
        title: Text(label),
        subtitle: Text(time != null ? time.format(context) : 'Not set'),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () async {
          final selectedTime = await showTimePicker(
            context: context,
            initialTime: time ?? TimeOfDay.now(),
          );
          if (selectedTime != null) {
            onSelect(selectedTime);
          }
        },
      ),
    );
  }

  Widget _buildQuantitySelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Urine Quantity',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          children: UrineQuantity.values.map((q) {
            final isSelected = _quantity == q;
            return ChoiceChip(
              label: Text(q.name.toUpperCase()),
              selected: isSelected,
              onSelected: (selected) {
                setState(() => _quantity = selected ? q : null);
              },
              selectedColor: AppTheme.getQuantityColor(q.name),
              labelStyle: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.w600,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildSmellSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Smell Level',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          children: SmellLevel.values.map((s) {
            final isSelected = _smell == s;
            return ChoiceChip(
              label: Text(_formatSmellLevel(s)),
              selected: isSelected,
              onSelected: (selected) {
                setState(() => _smell = selected ? s : null);
              },
              selectedColor: AppTheme.primaryColor,
              labelStyle: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.w600,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  String _formatSmellLevel(SmellLevel level) {
    switch (level) {
      case SmellLevel.tooMuch:
        return 'Too Much';
      case SmellLevel.low:
        return 'Low';
      case SmellLevel.noSmell:
        return 'No Smell';
    }
  }

  Widget _buildMoodSelectors() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'How did you feel?',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        const Text('Bedtime Feeling', style: TextStyle(fontSize: 14)),
        const SizedBox(height: 8),
        _buildMoodSelector(_bedtimeFeeling, (mood) => setState(() => _bedtimeFeeling = mood)),
        const SizedBox(height: 16),
        const Text('Wake Up Feeling', style: TextStyle(fontSize: 14)),
        const SizedBox(height: 8),
        _buildMoodSelector(_wakeUpFeeling, (mood) => setState(() => _wakeUpFeeling = mood)),
      ],
    );
  }

  Widget _buildMoodSelector(MoodLevel? selected, Function(MoodLevel) onSelect) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: MoodLevel.values.map((mood) {
        final isSelected = selected == mood;
        return GestureDetector(
          onTap: () => onSelect(mood),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: isSelected 
                      ? AppTheme.getMoodColor(mood.name) 
                      : Colors.grey[200],
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  _getMoodIcon(mood),
                  color: isSelected ? Colors.white : Colors.grey,
                  size: 24,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                _formatMoodLevel(mood),
                style: TextStyle(
                  fontSize: 10,
                  color: isSelected ? AppTheme.getMoodColor(mood.name) : Colors.grey,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ],
          ),
        );
      }).toList(),
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

  String _formatMoodLevel(MoodLevel mood) {
    return mood.name[0].toUpperCase() + mood.name.substring(1);
  }

  Widget _buildNotesField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Notes',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: _notesController,
          maxLines: 4,
          decoration: const InputDecoration(
            hintText: 'Add any notes or observations...',
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }

  Widget _buildSaveButton() {
    return ElevatedButton(
      onPressed: _saveEntry,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
      child: const Text('Save Entry', style: TextStyle(fontSize: 16)),
    );
  }

  void _saveEntry() {
    if (_formKey.currentState!.validate()) {
      final entry = BedwettingEntry(
        id: 'bw_${DateTime.now().millisecondsSinceEpoch}',
        userId: _mockService.getUser().id,
        incidentDate: _incidentDate,
        approximateTime: _approximateTime != null
            ? DateTime(_incidentDate.year, _incidentDate.month, _incidentDate.day,
                _approximateTime!.hour, _approximateTime!.minute)
            : null,
        sleepTime: _sleepTime != null
            ? DateTime(_incidentDate.year, _incidentDate.month, _incidentDate.day,
                _sleepTime!.hour, _sleepTime!.minute)
            : null,
        wakeTime: _wakeTime != null
            ? DateTime(_incidentDate.year, _incidentDate.month, _incidentDate.day,
                _wakeTime!.hour, _wakeTime!.minute)
            : null,
        quantity: _quantity,
        smell: _smell,
        wakeUpFeeling: _wakeUpFeeling,
        bedtimeFeeling: _bedtimeFeeling,
        notes: _notesController.text.isNotEmpty ? _notesController.text : null,
        createdAt: DateTime.now(),
      );

      _mockService.addBedwettingEntry(entry);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Entry saved successfully!'),
          backgroundColor: AppTheme.successColor,
        ),
      );

      Navigator.pop(context);
    }
  }
}
