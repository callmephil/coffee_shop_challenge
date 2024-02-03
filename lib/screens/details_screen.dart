import 'package:coffee_shop_challenge/constants/app_text_styles.dart';
import 'package:coffee_shop_challenge/extensions/string_extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: () => context.pop()),
        title: Text('Details'.tr, style: context.textStyle.headlineSmall),
        actions: [
          IconButton(
            tooltip: 'Favorite'.tr,
            icon: const Icon(Icons.favorite_border),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
