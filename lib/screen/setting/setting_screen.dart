import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slurp_restaurant_app/provider/setting/local_notification_providers.dart';
import 'package:slurp_restaurant_app/provider/setting/scheduling_provider.dart';
import 'package:slurp_restaurant_app/screen/setting/widget/radio_theme_button.dart';
import 'package:slurp_restaurant_app/utils/theme/theme_extensions.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    final backgroundCard = Theme.of(context).colorScheme.surfaceBright;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerLow,
      appBar: AppBar(
        title: const Text(
          "Setting App",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).colorScheme.surfaceContainerLow,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
          bottom: MediaQuery.of(context).viewInsets.bottom + 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _header(context, 'App Setting'),
            Card(
              color: backgroundCard,
              elevation: 6,
              shadowColor: Colors.black38,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    key: const ValueKey("themeMenuTile"),
                    leading: Icon(Icons.dark_mode_rounded),
                    title: Text('Theme App', style: context.text.bodyMedium),
                    trailing: Icon(Icons.arrow_forward_ios_rounded, size: 15),
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return RadioThemeButton();
                        },
                      );
                    },
                  ),
                  const Divider(height: 1),
                  Consumer<SchedulingProvider>(
                    builder: (context, provider, child) {
                      return ListTile(
                        leading: Icon(Icons.notifications_active),
                        title: Text(
                          'Daily Reminder',
                          style: context.text.bodyMedium,
                        ),
                        subtitle: Text(
                          'Enable random restaurant recommendation at 11 AM',
                          style: context.text.labelSmall?.copyWith(
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                        trailing: Switch(
                          value: provider.isScheduled,
                          onChanged: (value) async {
                            await provider.scheduledReminder(
                              value,
                              context.read<LocalNotificationProvider>(),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _header(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Text(
        title.toUpperCase(),
        style: context.text.bodyLarge?.copyWith(
          color: Theme.of(context).colorScheme.outline,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
