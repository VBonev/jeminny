import 'package:flutter/material.dart';

import '../assets.dart';
import '../strings.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    Key? key,
    required this.onTap,
    required this.body,
  }) : super(key: key);
  final Widget body;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.messenger_outline),
            onPressed: onTap,
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
        body: body,
      ),
    );
  }
}
