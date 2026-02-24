import 'package:flutter/material.dart';
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
        title: const Text("Setting App", style: TextStyle(fontWeight: FontWeight.bold)),
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
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return RadioThemeButton();
                        },
                      );
                    },
                    child: ListTile(
                      leading: Icon(Icons.dark_mode_rounded),
                      title: Text(
                        'Theme App',
                        style: context.text.bodyMedium,
                      ),
                      trailing: Icon(Icons.arrow_forward_ios_rounded, size: 15),
                    ),
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

class SettingList extends StatelessWidget {
  final Widget? leading;
  final Widget? title;
  final Widget? subtitle;
  final Widget? trailing;
  final bool? isThreeLine;
  final bool? dense;
  final VisualDensity? visualDensity;
  final ShapeBorder? shape;
  final ListTileStyle? style;

  const SettingList({
    super.key,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    this.isThreeLine,
    this.dense,
    this.visualDensity,
    this.shape,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text('Theme App'),
      trailing: Icon(Icons.arrow_forward_ios_rounded, size: 15),
    );
  }
}
