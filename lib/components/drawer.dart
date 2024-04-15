import 'package:flutter/material.dart';
import 'package:project/components/drawer_tile.dart';
import 'package:project/pages/home_page.dart';
import 'package:project/pages/settings.dart';
class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          Container(
            height: 150, // Adjust the height of the drawer header as needed
            width: double.infinity,
            color: Theme.of(context).colorScheme.background, // Set the background color to match the drawer's background color
            child: Padding(
              padding: const EdgeInsets.all(35.0), // Adjust the padding as needed
              child: Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'lib/images/logo.png', // Replace 'lib/images/logo.png' with the path to your logo
                  fit: BoxFit.contain, // Ensure the logo fits within the container
                ),
              ),
            ),
          ),
          DrawerTile(
            title: "Login Page",
            leading: Icon(Icons.account_circle),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Homepage()),
              );
            },
          ),
          DrawerTile(
            title: "Notes",
            leading: Icon(Icons.home),
            onTap: () => Navigator.pop(context),
          ),
          DrawerTile(
            title: "Settings",
            leading: Icon(Icons.settings),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
            },
          ),
        ],
      ),
    );
  }

}

