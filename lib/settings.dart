import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey[600],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7.5)),
                minimumSize: const Size(325, 40),
              ),
              onPressed: () {},
              child: const Text('Account', textScaleFactor: 1.2),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey[600],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7.5)),
                minimumSize: const Size(325, 40),
              ),
              onPressed: () {},
              child: const Text('Theme', textScaleFactor: 1.2),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey[600],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7.5)),
                minimumSize: const Size(325, 40),
              ),
              onPressed: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('You will be logged out'),
                  content: const Text('Are you sure?'),
                  actions: <Widget>[
                    TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: const Text('Cancel')),
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'logout'),
                      child: const Text('logout'),
                    )
                  ],
                ),
              ),
              child: const Text('Logout', textScaleFactor: 1.2),
            ),
          ],
        ),
      ),
    );
  }
}