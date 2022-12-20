import 'package:flutter/material.dart';
import 'package:practice/home_page.dart';
import 'package:practice/settings.dart';
import 'package:practice/tickets.dart';
import 'package:practice/wallet.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.pink[900],
        ),
      ),
      home: const Start(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Start extends StatefulWidget {
  const Start({super.key});

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  int currIndex = 0;
  List<Widget> pages = const [HomePage(), Tickets(), SettingsPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const Wallet();
                  },
                ),
              );
            },
            icon: const Icon(Icons.account_balance_wallet_rounded),
          ),
        ],
        iconTheme: const IconThemeData(color: Colors.black87),
        centerTitle: true,
        title: const Text("Practice App"),
        //backgroundColor: Colors.pink[900],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text('Scan QR'),
              onTap: () {},
            )
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        destinations: [
          NavigationDestination(
            label: 'Home',
            icon: const Icon(Icons.home),
            selectedIcon: Icon(
              Icons.home,
              color: Colors.pink[900],
            ),
          ),
          NavigationDestination(
            icon: const Icon(Icons.airplane_ticket_outlined),
            label: 'Tickets',
            selectedIcon: Icon(
              Icons.airplane_ticket_rounded,
              color: Colors.pink[900],
            ),
          ),
          NavigationDestination(
            label: "Settings",
            icon: const Icon(Icons.settings),
            selectedIcon: Icon(
              Icons.settings,
              color: Colors.pink[900],
            ),
          ),
        ],
        selectedIndex: currIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currIndex = index;
          });
        },
      ),
      body: pages[currIndex],
    );
  }
}