import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const CardWidget({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Card(
        elevation: 4,
        child: InkWell(
          onTap: onTap,
          child: ListTile(
            title: Text(title),
            trailing: const Icon(
              Icons.arrow_forward_rounded,
            ),
          ), 
        ),
      ),
    );
  }
}
