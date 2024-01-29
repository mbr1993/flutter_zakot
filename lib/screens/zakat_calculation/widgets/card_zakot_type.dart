import 'package:flutter/material.dart';

class ZakotTypeCard extends StatelessWidget {
  const ZakotTypeCard({required this.text, required this.isChecked, super.key});

  final String text;
  final bool isChecked;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              if (isChecked)
                const Icon(
                  Icons.check_circle_outline,
                  color: Colors.green,
                )
              else
                const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
