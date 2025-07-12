import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'components/upcoming_card.dart';
import 'components/kpi_card.dart';
import 'components/recent_payments.dart';
import 'components/bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payments',
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add, size: 28),
            onPressed: () {
              context.push('/payments/add');
            },
          )
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        children: [
          // Upcoming Section
          const SizedBox(height: 8),
          const Text('Upcoming',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          const SizedBox(height: 12),
          const UpcomingCard(
            icon: Icons.home,
            title: 'Rent',
            subtitle: 'Due in 2 days',
            amount: ' 241,200',
          ),
          const SizedBox(height: 10),
          const UpcomingCard(
            icon: Icons.movie,
            title: 'Subscription',
            subtitle: 'Due in 5 days',
            amount: ' 2415',
          ),
          const SizedBox(height: 24),
          // Analysis Section
          const Text('Analysis',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          const SizedBox(height: 12),
          const Row(
            children: [
              Expanded(child: KpiCard(title: 'Total Spent', value: ' 243,450')),
              SizedBox(width: 12),
              Expanded(
                  child: KpiCard(title: 'Avg. Monthly', value: ' 241,150')),
            ],
          ),
          const SizedBox(height: 24),
          // Recent Payments Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Recent Payments',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              TextButton(
                onPressed: () {},
                child: const Text('See All'),
              ),
            ],
          ),
          const RecentPaymentTile(
              icon: Icons.local_grocery_store,
              title: 'Grocery',
              subtitle: '2 days ago',
              amount: ' 24120'),
          const RecentPaymentTile(
              icon: Icons.bolt,
              title: 'Utilities',
              subtitle: '5 days ago',
              amount: ' 24250'),
          const RecentPaymentTile(
              icon: Icons.restaurant,
              title: 'Dining',
              subtitle: '1 week ago',
              amount: ' 2480'),
          const SizedBox(height: 8),
          const Divider(),
          const SizedBox(height: 8),
          // Payment Types Section
          const Text('Payment Types',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 8),
          const Text('Expenses', style: TextStyle(fontWeight: FontWeight.w500)),
          const SizedBox(height: 2),
          const Row(
            children: [
              Text(' 243,450',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
              SizedBox(width: 12),
              Text('This Month ', style: TextStyle(color: Colors.grey)),
              Text('+12%',
                  style: TextStyle(
                      color: Colors.green, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 16),
          // Simple Bar Chart (static)
          const SizedBox(
            height: 80,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Bar(label: 'Food', value: 60),
                Bar(label: 'Rent', value: 15),
                Bar(label: 'Utilities', value: 15),
                Bar(label: 'Entertainment', value: 50),
              ],
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
