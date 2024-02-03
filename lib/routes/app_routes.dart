import 'package:coffee_shop_challenge/screens/delivery_screen.dart';
import 'package:coffee_shop_challenge/screens/details_screen.dart';
import 'package:coffee_shop_challenge/screens/favorites_screen.dart';
import 'package:coffee_shop_challenge/screens/home_screen.dart';
import 'package:coffee_shop_challenge/screens/profile_screen.dart';
import 'package:coffee_shop_challenge/screens/splash_screen.dart';
import 'package:go_router/go_router.dart';

enum AppRoutesEnum {
  splash('/'),
  home('/home'),
  details('/details/:id'),
  order('/order/:id'),
  delivery('/delivery'),
  favorites('/favorites'),
  profile('/profile'),
  ;

  const AppRoutesEnum(this.path);

  final String path;
}

class AppRoutes {
  const AppRoutes._();

  static GoRouter get routerConfig {
    return GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: AppRoutesEnum.splash.path,
          name: AppRoutesEnum.splash.name,
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
          path: AppRoutesEnum.home.path,
          name: AppRoutesEnum.home.name,
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: '/details/:id',
          name: AppRoutesEnum.details.name,
          builder: (context, state) => const DetailsScreen(),
        ),
        GoRoute(
          path: '/order/:id',
          name: AppRoutesEnum.order.name,
          builder: (context, state) => const DetailsScreen(),
        ),
        GoRoute(
          path: '/delivery',
          name: AppRoutesEnum.delivery.name,
          builder: (context, state) => const DeliveryScreen(),
        ),
        GoRoute(
          path: '/favorites',
          name: AppRoutesEnum.favorites.name,
          builder: (context, state) => const FavoritesScreen(),
        ),
        // profile
        GoRoute(
          path: '/profile',
          name: AppRoutesEnum.profile.name,
          builder: (context, state) => const ProfileScreen(),
        ),
      ],
    );
  }
}
