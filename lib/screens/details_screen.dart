import 'package:coffee_shop_challenge/constants/constants.dart';
import 'package:coffee_shop_challenge/extensions/string_extensions.dart';
import 'package:coffee_shop_challenge/routes/app_routes.dart';
import 'package:coffee_shop_challenge/routes/go_router_extensions.dart';
import 'package:collection/collection.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: AppBar(
            leading: BackButton(
              onPressed: () {
                context.popOr(
                  orElse: () => context.goNamed(AppRoutesEnum.home.name),
                );
              },
            ),
            title: Text('Details'.tr, style: context.textStyle.headlineSmall),
            actions: [
              IconButton(
                tooltip: 'Favorite'.tr,
                icon: const Icon(Icons.favorite_border),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(AppSizes.s24),
        ),
        child: BottomAppBar(
          height: 121,
          child: Padding(
            padding: const EdgeInsets.all(AppSizes.s16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Price'.tr,
                      style: context.textStyle.bodyMedium?.lightGrey,
                    ),
                    const SizedBox(height: AppSizes.s16),
                    Text(
                      r'$4.53',
                      style: context.textStyle.headlineSmall?.orange,
                    ),
                  ],
                ),
                const Spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(217, 62),
                    backgroundColor: AppColors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSizes.s12),
                    ),
                  ),
                  onPressed: () {
                    context.go(AppRoutesEnum.order.path);
                  },
                  child: Text(
                    'Buy Now'.tr,
                    style: context.textStyle.labelLarge?.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            Image.asset(AppAssets.cappuccinoLarge, width: 315),
            const SizedBox(height: 24),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cappuccino'.tr,
                  style: context.textStyle.titleLarge,
                ),
                const SizedBox(height: 4),
                Text(
                  'Espresso, hot milk, and a steamed milk foam'.tr,
                  style: context.textStyle.bodySmall?.lightGrey,
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // TODO: figure out how to position this at the bottom left
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Row(
                        children: [
                          const Icon(
                            Icons.star_rounded,
                            color: Color(0xFFFBBE21),
                            size: 20,
                          ),
                          RichText(
                            text: TextSpan(
                              text: '4.8',
                              style: context.textStyle.bodyMedium?.w600,
                              children: [
                                TextSpan(
                                  text: ' (230 Reviews)',
                                  style: context.textStyle.bodySmall?.lightGrey,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Row(
                      children: [
                        SizedBox(
                          width: 44,
                          height: 44,
                          child: ColoredBox(color: AppColors.grey),
                        ),
                        SizedBox(width: 4),
                        SizedBox(
                          width: 44,
                          height: 44,
                          child: ColoredBox(color: AppColors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Divider(),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Description'.tr, style: context.textStyle.headlineSmall),
                const SizedBox(height: 16),
                ExpandableText(
                  'A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk the fo...',
                  expandText: 'Read More',
                  collapseText: 'Show Less',
                  expanded: true,
                  linkStyle: context.textStyle.bodySmall?.orange.w700,
                  style: context.textStyle.bodySmall,
                ),
                const SizedBox(height: 16),
                Text('Size'.tr, style: context.textStyle.headlineSmall),
                const SizeOptions(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SizeOptions extends StatefulWidget {
  const SizeOptions({super.key});

  @override
  State<SizeOptions> createState() => _SizeOptionsState();
}

class _SizeOptionsState extends State<SizeOptions> {
  String _selectedSize = 'S'; // Default selected size
  final Map<String, double> sizePrices = {
    'S': 3.53,
    'M': 4.53,
    'L': 6.53,
  };

  void _setSize(String size) {
    if (!mounted) return;

    setState(() {
      _selectedSize = size;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: sizePrices.entries.mapIndexed(
        (i, e) {
          return Expanded(
            child: Padding(
              padding: i.isOdd
                  ? const EdgeInsets.symmetric(horizontal: 4)
                  : i == 0
                      ? const EdgeInsets.only(right: 4)
                      : const EdgeInsets.only(left: 4),
              child: SizeOption(
                label: e.key,
                onPressed: _setSize,
                isSelected: _selectedSize == e.key,
              ),
            ),
          );
        },
      ).toList(growable: false),
    );
  }
}

class SizeOption extends StatelessWidget {
  const SizeOption({
    super.key,
    required this.label,
    this.onPressed,
    this.isSelected = false,
  });

  final String label;
  final void Function(String size)? onPressed;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        fixedSize:
            MaterialStateProperty.all<Size>(const Size(double.infinity, 43)),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return AppColors.orangeLight;
            }

            return isSelected ? AppColors.orangeLight : AppColors.white;
          },
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.s12),
            side: BorderSide(
              color: isSelected ? AppColors.orange : AppColors.grey,
            ),
          ),
        ),
      ),
      onPressed: () => onPressed?.call(label),
      child: Center(
        child: Text(
          label,
          style: context.textStyle.bodyMedium?.copyWith(
            color: isSelected ? AppColors.orange : AppColors.black,
          ),
        ),
      ),
    );
  }
}
