import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Home Page'),
      ),
    );
  }
}

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

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  int balance = 0;
  //final _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Wallet'),
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 25,
              left: 48,
              child: Container(
                height: 120,
                width: 320,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13.5),
                  color: Colors.pinkAccent[700],
                ),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(3.0),
                      child: Text(
                        '\n Balance ',
                        style: TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        '₹ $balance',
                        style: const TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            /*Positioned(
              top: 165,
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: TextField(
                  controller: _textController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: () {
                        _textController.clear();
                      },
                      icon: const Icon(Icons.clear_rounded),
                    ),
                  ),
                ),
              ),
            ),*/
            Positioned(
              top: 250,
              left: 30,
              child: SizedBox(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[800]),
                  onPressed: (() {
                    setState(() {
                      balance += 500;
                    });
                  }),
                  child: const Text('Add 500'),
                ),
              ),
            ),
            Positioned(
              top: 250,
              right: 30,
              child: SizedBox(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[800]),
                  onPressed: (() {
                    setState(
                      () {
                        if (balance <= 0) {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text('Insufficient balance'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text('OK'),
                                )
                              ],
                            ),
                          );
                        } else {
                          balance -= 500;
                        }
                      },
                    );
                  }),
                  child: const Text('Remove 500'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}