import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 25.0),
        child: Row(
          children: [
            Text("Dark Mode", style: GoogleFonts.chakraPetch(),),
            CupertinoSwitch(value:
            Provider.of<ThemeProvider>(context,listen: false).isDarkMode,
                onChanged: (value) =>
                    Provider.of<ThemeProvider>(context, listen: false).toggleTheme(),),
          ],
        ),
      ),
    );
  }
}
