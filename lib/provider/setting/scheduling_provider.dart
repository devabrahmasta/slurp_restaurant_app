import 'package:flutter/material.dart';
import 'package:slurp_restaurant_app/provider/setting/local_notification_providers.dart';
import 'package:slurp_restaurant_app/services/shared_preferences_service.dart';

class SchedulingProvider extends ChangeNotifier {
  final SharedPreferencesService _service;
  bool _isScheduled = false;

  SchedulingProvider(this._service) {
    _isScheduled = _service.getReminderValue();
  }

  bool get isScheduled => _isScheduled;

  Future<void> scheduledReminder(
    bool value,
    LocalNotificationProvider notifProvider,
  ) async {
    _isScheduled = value;
    await _service.saveReminderValue(value);

    if (_isScheduled) {
      notifProvider.scheduleDailyElevenAMNotification();
    } else {
      await notifProvider.cancelNotification(2);
    }
    notifyListeners();
  }
}
