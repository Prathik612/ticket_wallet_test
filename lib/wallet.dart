import 'package:flutter/material.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  static int balance = 0;
  var textval = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Wallet',
          style: TextStyle(fontFamily: 'Ariel'),
        ),
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
                          fontFamily: 'Ariel',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        '₹ $balance',
                        style: const TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 175,
              left: 48,
              child: SizedBox(
                width: 320,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: textval,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Colors.red,
                      ),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        textval.clear();
                      },
                      icon: const Icon(Icons.clear_rounded),
                    ),
                    prefixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.currency_rupee),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 250,
              left: 48,
              child: SizedBox(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[800]),
                  onPressed: (() {
                    setState(() {
                      String temp = textval.text.toString();
                      balance += int.parse(temp);
                      textval.clear();
                    });
                  }),
                  child: const Text('Deposit'),
                ),
              ),
            ),
            Positioned(
              top: 250,
              right: 48,
              child: SizedBox(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[800]),
                  onPressed: (() {
                    setState(
                      () {
                        String temp = textval.text.toString();
                        if (balance <= 0 || int.parse(temp) > balance) {
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
                          String temp = textval.text.toString();
                          balance -= int.parse(temp);
                          textval.clear();
                        }
                      },
                    );
                  }),
                  child: const Text('Withdraw'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}