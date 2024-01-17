import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  const ListItem({
    required this.title,
    required this.description,
    required this.icon,
    required this.inDetailOnPressed,
    super.key,
  });

  final String title;
  final String description;
  final IconData icon;
  final VoidCallback? inDetailOnPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.green[700],
              child: Icon(
                icon,
                color: Colors.greenAccent[100],
                size: 30,
              ),
            ),
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            textAlign: TextAlign.center,
            softWrap: true,
            maxLines: 4,
            overflow: TextOverflow.fade,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: TextButton(
              onPressed: inDetailOnPressed,
              child: Text(
                'Batafsil',
                style: TextStyle(color: Colors.orange[800], fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
