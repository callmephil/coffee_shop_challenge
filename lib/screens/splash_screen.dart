import 'package:coffee_shop_challenge/constants/constants.dart';
import 'package:coffee_shop_challenge/extensions/string_extensions.dart';
import 'package:coffee_shop_challenge/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  static const _animationDuration = Duration(milliseconds: 1600);
  late final AnimationController _controller = AnimationController(
    duration: _animationDuration,
    vsync: this,
  );
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _initAnimation();
    _navigateToHome();
  }

  void _initAnimation() {
    _animation = TweenSequence<double>([
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 0, end: 1),
        weight: 50,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 1, end: 0),
        weight: 50,
      ),
    ]).animate(_controller);

    _controller.forward();
  }

  void _navigateToHome() {
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        context.replaceNamed(AppRoutesEnum.home.name);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: FadeTransition(
        opacity: _animation,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            color: AppColors.black,
            image: DecorationImage(
              image: AssetImage(AppAssets.splash),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(AppSizes.s32),
              child: RichText(
                text: TextSpan(
                  text: 'Coffee \n'.tr,
                  style: context.textStyle.displaySmall?.white.copyWith(
                    letterSpacing: 2,
                  ),
                  children: [
                    TextSpan(
                      text: 'Challenge'.tr,
                      style: context.textStyle.displaySmall?.white.copyWith(
                        color: AppColors.orange,
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
