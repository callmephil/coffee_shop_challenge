import 'package:coffee_shop_challenge/screens/delivery_screen.dart';
import 'package:coffee_shop_challenge/screens/details_screen.dart';
import 'package:coffee_shop_challenge/screens/favorites_screen.dart';
import 'package:coffee_shop_challenge/screens/home_screen.dart';
import 'package:coffee_shop_challenge/screens/profile_screen.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  const AppRoutes._();

  static GoRouter get routes {
    return GoRouter(
      initialExtra: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: '/details/:id',
          builder: (context, state) => const DetailsScreen(),
        ),
        GoRoute(
          path: '/order/:id',
          builder: (context, state) => const DetailsScreen(),
        ),
        GoRoute(
          path: '/delivery',
          builder: (context, state) => const DeliveryScreen(),
        ),

        // Custom Screens
        // favorties
        GoRoute(
          path: '/favorites',
          builder: (context, state) => const FavoritesScreen(),
        ),
        // profile
        GoRoute(
          path: '/profile',
          builder: (context, state) => const ProfileScreen(),
        ),
      ],
    );
  }
}
