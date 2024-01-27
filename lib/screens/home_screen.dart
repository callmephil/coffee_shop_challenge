import 'package:coffee_shop_challenge/constants/app_assets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Image.asset(
              AppAssets.promotion1,
            ),
            Image.asset(
              AppAssets.americano,
              width: 132,
              height: 141,
            ),
            Image.asset(
              AppAssets.cappuccino,
              width: 132,
              height: 141,
            ),
            Image.asset(
              AppAssets.cappuccinoLarge,
            ),
            Image.asset(
              AppAssets.latte,
              width: 132,
              height: 141,
            ),
            Image.asset(
              AppAssets.latteSpecial,
              width: 132,
              height: 141,
            ),
            Image.asset(
              AppAssets.splash,
              width: 132,
              height: 141,
            ),
          ],
        ),
      ),
    );
  }
}
