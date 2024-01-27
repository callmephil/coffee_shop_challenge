import 'package:flutter/material.dart'
    show AssetImage, BuildContext, immutable, precacheImage;

@immutable
class AppAssets {
  const AppAssets._();

  static const String appIcon = 'assets/avatars';
  static const String iconsPath = 'assets/icons';
  static const String imagePath = 'assets/images';
  static const String gifsPath = 'assets/gifs';

  static const String latte = '$imagePath/latte.png';
  static const String americano = '$imagePath/americano.png';
  static const String cappuccino = '$imagePath/cappuccino.png';
  static const String cappuccinoLarge = '$imagePath/cappuccino_large.png';
  static const String latteSpecial = '$imagePath/latte_special.png';
  static const String promotion1 = '$imagePath/promotion_1.png';

  static const String splash = '$gifsPath/running_mug.gif';

  static void preCacheAssets(BuildContext context) {
    precacheImage(const AssetImage(americano), context);
    precacheImage(const AssetImage(cappuccino), context);
    precacheImage(const AssetImage(cappuccinoLarge), context);
    precacheImage(const AssetImage(latte), context);
    precacheImage(const AssetImage(latteSpecial), context);
    precacheImage(const AssetImage(promotion1), context);
    precacheImage(const AssetImage(splash), context);
  }
}
