import 'package:flutter/material.dart';

class Bar extends StatelessWidget {
  final String label;
  final double value; // 0-100
  const Bar({super.key, required this.label, required this.value});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 32,
          height: value,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(6),
            border: Border(
              top: BorderSide(color: Colors.grey[400]!, width: 2),
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(label,
            style: const TextStyle(fontSize: 13, color: Colors.blueGrey)),
      ],
    );
  }
}
