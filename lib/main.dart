import 'package:flutter/material.dart';
import 'package:practice/ui.dart';

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
      theme: ThemeData(appBarTheme: AppBarTheme(color: Colors.pink[900])),
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
      body: Center(
        child: currIndex == 1 ?  const SettingsPage() : const HomePage(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedIconTheme: const IconThemeData.fallback(),
        unselectedIconTheme: const IconThemeData.fallback(),
        unselectedItemColor: Colors.black45,
        selectedItemColor: Colors.redAccent,
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
            activeIcon: Icon(
              Icons.home_rounded,
              //color: Color.fromARGB(255, 225, 34, 34),
            ),
          ),
          BottomNavigationBarItem(
            label: "Settings",
            icon: Icon(Icons.settings),
            activeIcon: Icon(
              Icons.settings,
              color: Colors.blueGrey,
            ),
          ),
        ],
        currentIndex: currIndex,
        onTap: (int index) {
          setState(() {
            currIndex = index;
          });
        },
      ),
    );
  }
}

