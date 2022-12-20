import 'package:flutter/material.dart';

class Tickets extends StatefulWidget {
  const Tickets({super.key});

  @override
  State<Tickets> createState() => _TicketsState();
}

class _TicketsState extends State<Tickets> {
  String to = '', from = '';
  static const List<String> options = [
    'MANGALURU(IXE)',
    'DOHA(DOH)',
    'BENGALURU(BLR)',
    'CHENNAI(MAA)',
    'DELHI(DEL)',
    'HYDERABAD(HYD)',
    'GOA(GOI)'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            child: Text(
              ' To: ',
              textScaleFactor: 1.5,
            ),
          ),
          Autocomplete<String>(
            optionsBuilder: (TextEditingValue textEditingValue) {
              if (textEditingValue.text == '') {
                return const Iterable<String>.empty();
              }
              return options.where((String opt) {
                return opt.contains(textEditingValue.text.toUpperCase());
              });
            },
            onSelected: (String selection) {
              to = selection;
            },
            fieldViewBuilder: (BuildContext context,
                TextEditingController textEditingController,
                FocusNode focusNode,
                VoidCallback onFieldSubmitted) {
              return TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      textEditingController.clear();
                    },
                    icon: const Icon(Icons.clear_rounded),
                  ),
                  prefixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.pin_drop),
                  ),
                ),
                controller: textEditingController,
                focusNode: focusNode,
              );
            },
          ),
          const SizedBox(
            child: Text('\n\n'),
          ),
          const SizedBox(
            child: Text(
              ' From: ',
              textScaleFactor: 1.5,
            ),
          ),
          Autocomplete(
            optionsBuilder: (TextEditingValue textEditingValue) {
              if (textEditingValue.text == '' ||
                  textEditingValue.text.toUpperCase() == to) {
                return const Iterable<String>.empty();
              }
              return options.where((String opt) {
                return opt.contains(
                  textEditingValue.text.toUpperCase(),
                );
              });
            },
            onSelected: (String selection) {
              from = selection;
            },
            fieldViewBuilder: (BuildContext context,
                TextEditingController textEditingController,
                FocusNode focusNode,
                VoidCallback onFieldSubmitted) {
              return TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      textEditingController.clear();
                    },
                    icon: const Icon(Icons.clear_rounded),
                  ),
                  prefixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.pin_drop),
                  ),
                ),
                controller: textEditingController,
                focusNode: focusNode,
              );
            },
          ),
        ],
      ),
    );
  }
}
