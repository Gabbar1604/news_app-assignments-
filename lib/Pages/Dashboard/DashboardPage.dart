import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/Controller/NewsController.dart';
import 'package:news_app/Pages/Profile/ProfilePage.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final newsController = Get.find<NewsController>();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Dashboard',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      Get.to(const ProfilePage());
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: const Icon(Icons.person),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'Quick Overview',
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withOpacity(0.6),
                ),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  children: [
                    Obx(
                      () => _buildStatCard(
                        context,
                        'Trending News',
                        '${newsController.trandingNewsList.length}',
                        Icons.trending_up,
                        Colors.blue,
                      ),
                    ),
                    Obx(
                      () => _buildStatCard(
                        context,
                        'For You',
                        '${newsController.newsForYouList.length}',
                        Icons.person,
                        Colors.green,
                      ),
                    ),
                    Obx(
                      () => _buildStatCard(
                        context,
                        'Apple News',
                        '${newsController.appleNewsList.length}',
                        Icons.apple,
                        Colors.orange,
                      ),
                    ),
                    Obx(
                      () => _buildStatCard(
                        context,
                        'Tesla News',
                        '${newsController.teslaNewsList.length}',
                        Icons.electric_car,
                        Colors.red,
                      ),
                    ),
                    Obx(
                      () => _buildStatCard(
                        context,
                        'Business',
                        '${newsController.businessNewsList.length}',
                        Icons.business,
                        Colors.purple,
                      ),
                    ),
                    _buildStatCard(
                      context,
                      'Categories',
                      '5',
                      Icons.category,
                      Colors.teal,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(
    BuildContext context,
    String title,
    String count,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(icon, size: 30, color: color),
          ),
          const SizedBox(height: 8),
          Text(
            count,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 10,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
            ),
          ),
        ],
      ),
    );
  }
}
