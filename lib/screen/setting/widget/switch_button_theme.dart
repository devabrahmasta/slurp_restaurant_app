// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:slurp_restaurant_app/data/model/setting.dart';
// import 'package:slurp_restaurant_app/provider/setting/shared_preferences_service.dart';
// import 'package:slurp_restaurant_app/provider/setting/theme_state_provider.dart';
// import 'package:slurp_restaurant_app/utils/theme_state.dart';

// class SwitchButton extends StatefulWidget {
//   const SwitchButton({super.key});

//   @override
//   State<SwitchButton> createState() => SwitchButtonState();
// }

// class SwitchButtonState extends State<SwitchButton> {

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<DarkThemeStateProvider>(
//       builder: (_, provider, _) {
//         return Switch(
//           value: provider.darkThemeState.isEnable,
//           onChanged: (value) {
//             provider.darkThemeState = value.isEnable;

//             context.read<SharedPreferencesProvider>().saveSettingValue(
//               Setting(screenTheme: value),
//             );
//           },
//           activeThumbColor: Theme.of(context).colorScheme.primary,
//           activeTrackColor: Theme.of(context).colorScheme.primaryContainer,
//           inactiveThumbColor: Colors.grey,
//           inactiveTrackColor: Colors.grey.shade300,
//         );
//       },
//     );
//   }
// }
