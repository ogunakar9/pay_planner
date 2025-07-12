import 'package:flutter/material.dart';

class RecentPaymentTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String amount;
  const RecentPaymentTile(
      {super.key,
      required this.icon,
      required this.title,
      required this.subtitle,
      required this.amount});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(10),
        child: Icon(icon, color: Colors.grey[700]),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
      subtitle: Text(subtitle, style: const TextStyle(color: Colors.blueGrey)),
      trailing:
          Text(amount, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}
