import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slurp_restaurant_app/data/model/setting.dart';
import 'package:slurp_restaurant_app/provider/setting/shared_preferences_service.dart';
import 'package:slurp_restaurant_app/provider/setting/theme_state_provider.dart';
import 'package:slurp_restaurant_app/utils/theme_state.dart';

class RadioThemeButton extends StatelessWidget {
  const RadioThemeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 30,
        left: 20,
        right: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom + 36,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Theme App',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          const SizedBox(height: 10),

          Flexible(
            child: SingleChildScrollView(
              child: Consumer<ThemeStateProvider>(
                builder: (context, provider, child) {
                  return RadioGroup<ThemeState>(
                    groupValue: provider.themeState,
                    onChanged: (ThemeState? value) {
                      if (value != null) {
                        provider.themeState = value;
                  
                        context.read<SharedPreferencesProvider>().saveSettingValue(
                          Setting(screenTheme: value.name),
                        );
                      }
                    },
                    child: Column(
                      children: [
                        RadioListTile<ThemeState>(
                          title: const Text("System Default"),
                          value: ThemeState.system,
                        ),
                        RadioListTile<ThemeState>(
                          title: const Text("Light Mode"),
                          value: ThemeState.light,
                        ),
                        RadioListTile<ThemeState>(
                          title: const Text("Dark Mode"),
                          value: ThemeState.dark,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
