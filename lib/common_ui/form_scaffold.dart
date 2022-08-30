import 'package:flutter/material.dart';

import '../assets.dart';
import '../strings.dart';

class FormsScaffold extends StatelessWidget {
  const FormsScaffold({Key? key, required this.body}) : super(key: key);
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.messenger_outline),
              onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                 SnackBar(
                  content: Text(Strings.dummyText),
                ),
              ),
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: IconButton(
                  iconSize: 40,
                  icon: Image.asset(icProfile),
                  onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                     SnackBar(
                      content: Text(Strings.dummyText),
                    ),
                  ),
                ),
              ),
            ],
          ),
          body: body),
    );
  }
}
