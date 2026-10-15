/*
 * Francesca Oliverio
 * 15/10/2026
*/

import 'package:flutter/material.dart';

// AppTheme (StatefulWidget)
//   └─ _AppThemeState (State<AppTheme>)   ← not a widget: its build() returns underlying tree
//       └─ MaterialApp (theme / darkTheme / themeMode / home)
//           └─ SettingsApp (home)
//               └─ Scaffold
//                   ├─ AppBar
//                   │   └─ Text(Title)
//                   └─ body: ScrollView
//                       ├─ SwitchListTile  // Sound
//                       ├─ SwitchListTile  // Notifications
//                       ├─ Divider
//                       ├─ SwitchListTile  // Theme
//                       ├─ Container > Column > Text + Text
//                       ├─ Divider
//                       ├─ CheckboxListTile  // Terms
//                       ├─ CheckboxListTile  // Cookies
//                       ├─ OutlinedButton    // Save
//                       └─ FilledButton      // Reset

void main() {
  runApp(AppTheme());
}

class AppTheme extends StatefulWidget {
  const AppTheme({super.key});

  @override
  State<AppTheme> createState() => _AppThemeState();
}

class _AppThemeState extends State<AppTheme> {
  bool _dark = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "08_theme",
      debugShowCheckedModeBanner: false,
      themeMode: _dark ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: Brightness.dark,
        ),
      ),
      home: SettingsApp(
        dark: _dark,
        onToggleTheme: (value) => setState(() => _dark = value),
      ),
    );
  }
}

class SettingsApp extends StatelessWidget {
  const SettingsApp({
    super.key,
    required this.dark,
    required this.onToggleTheme,
  });

  final bool dark;
  final ValueChanged<bool> onToggleTheme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings"), centerTitle: true),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 10,
          children: [
            // ----- Sound Switch -----
            SwitchListTile(
              value: false,
              onChanged: null,
              title: Text("Silent mode"),
            ),
            // ----- Notifications Switch -----
            SwitchListTile(
              value: false,
              onChanged: null,
              title: Text("Notifications"),
            ),
            Divider(),
            // ----- Theme Switch -----
            SwitchListTile(
              value: dark,
              onChanged: onToggleTheme,
              title: Text("Theme"),
              subtitle: Text("Dark mode is ${dark ? "on" : "off"}"),
            ),
            // ----- Text Container (theme colored) -----
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Column(
                children: [
                  Text(
                    "Oh, wow!",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "This box changes color according to the theme.\n"
                    "Theme is currently ${dark ? "dark" : "light"}.",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            // ----- Terms Checkbox -----
            CheckboxListTile(
              tristate: true,
              value: null,
              onChanged: (value) {},
              title: Text("Accept terms"),
            ),
            // ----- Cookies Checkbox -----
            CheckboxListTile(
              value: false,
              onChanged: (value) {},
              title: Text("Allow cookies"),
            ),
            // ----- Save Button -----
            FilledButton(onPressed: () {}, child: Text("Save")),
            // ----- Reset Button -----
            OutlinedButton(onPressed: () {}, child: Text("Reset")),
          ],
        ),
      ),
    );
  }
}
