import 'package:flutter/material.dart';

class copy extends StatelessWidget {
  const copy({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextField(
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
              prefixIcon: Icon(Icons.search, color: theme.primaryColor),
              hintText: 'Search Article',
              counterStyle:
                  TextStyle(color: theme.primaryColor!.withOpacity(0.8)),
              suffixIcon: Icon(Icons.close, color: theme.primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
