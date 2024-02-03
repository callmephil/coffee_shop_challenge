import 'package:coffee_shop_challenge/constants/constants.dart';
import 'package:coffee_shop_challenge/extensions/string_extensions.dart';
import 'package:coffee_shop_challenge/models/product_model.dart';
import 'package:coffee_shop_challenge/routes/app_routes.dart';
import 'package:coffee_shop_challenge/widgets/custom_grid.dart';
import 'package:coffee_shop_challenge/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: AppColors.backgroundLight2,
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              activeIcon: Icon(Icons.home_filled),
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
        body: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.4,
                  width: double.infinity,
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Color(0xFF131313),
                          Color(0xFF313131),
                        ],
                      ),
                    ),
                    child: SafeArea(
                      minimum: const EdgeInsets.symmetric(
                        horizontal: AppSizes.s30,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 32, bottom: 100),
                        child: Column(
                          children: [
                            Expanded(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Location'.tr,
                                        style:
                                            context.textStyle.bodyLarge?.white,
                                      ),
                                      Expanded(
                                        child: RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: 'New York'.tr,
                                                style: context.textStyle
                                                    .titleLarge?.white,
                                              ),
                                              const TextSpan(text: ', '),
                                              TextSpan(
                                                text: 'USA'.tr,
                                                style: context.textStyle
                                                    .titleLarge?.white,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox.square(
                                    dimension: AppSizes.s44,
                                    child: Image.asset(AppAssets.cappuccino),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Search coffee'.tr,
                                  hintStyle: context.textStyle.bodyLarge?.white,
                                  prefixIcon: const Icon(
                                    Icons.search,
                                    color: AppColors.white,
                                  ),
                                  fillColor: AppColors.backgroundDark,
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      AppSizes.s12,
                                    ),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 74),
                const SizedBox(
                  height: AppSizes.s38,
                  child: FilterList(
                    onChange: print,
                    filters: [
                      'Cappuccino',
                      'Latte',
                      'Espresso',
                      'Mocha',
                      'Macchiato',
                      'Americano',
                      'Flat White',
                      'Cortado',
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                const Expanded(child: ProductList()),
              ],
            ),
            Positioned(
              top: MediaQuery.sizeOf(context).height * 0.4 - 100,
              left: 0,
              right: 0,
              child: Image.asset(AppAssets.promotion1),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  static const _products = [
    Product(
      id: '1',
      name: 'Cappuccino',
      price: 4.99,
      thumbnail: AppAssets.cappuccino,
      image: AppAssets.cappuccinoLarge,
    ),
    Product(
      id: '2',
      name: 'Latte',
      price: 7.99,
      thumbnail: AppAssets.latte,
      image: AppAssets.cappuccinoLarge,
    ),
    Product(
      id: '3',
      name: 'Espresso',
      price: 2.99,
      thumbnail: AppAssets.americano,
      image: AppAssets.cappuccinoLarge,
    ),
    Product(
      id: '4',
      name: 'Mocha',
      price: 3.99,
      thumbnail: AppAssets.latteSpecial,
      image: AppAssets.cappuccinoLarge,
    ),
    Product(
      id: '3',
      name: 'Espresso',
      price: 2.99,
      thumbnail: AppAssets.americano,
      image: AppAssets.cappuccinoLarge,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomGrid(
      crossAxisCount: 2,
      crossAxisSpacing: AppSizes.s16,
      mainAxisSpacing: AppSizes.s16,
      children: List.generate(
        _products.length,
        (_) {
          return ProductCard(
            onPressed: () {
              context.pushNamed(
                AppRoutesEnum.details.name,
                pathParameters: {
                  'id': '1',
                },
              );
            },
          );
        },
      ),
    );
  }
}

class FilterList extends StatefulWidget {
  const FilterList({super.key, this.onChange, this.filters = const []});

  final List<String> filters;
  final void Function(String?)? onChange;

  @override
  State<FilterList> createState() => _FilterListState();
}

class _FilterListState extends State<FilterList> {
  int? _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  void _setSelectedIndex(int index) {
    if (!mounted) return;

    if (_selectedIndex == index) {
      setState(() {
        _selectedIndex = null;
      });

      widget.onChange?.call(null);
    } else {
      setState(() {
        _selectedIndex = index;
      });

      widget.onChange?.call(widget.filters[index]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(left: 30),
      separatorBuilder: (_, __) => const SizedBox(width: 4),
      itemCount: 8,
      itemBuilder: (_, index) {
        final item = widget.filters[index];

        return FilterChip(
          key: ValueKey(item),
          label: item,
          selected: _selectedIndex == index,
          onPressed: () => _setSelectedIndex(index),
        );
      },
    );
  }
}

class FilterChip extends StatelessWidget {
  const FilterChip({
    super.key,
    this.selected = false,
    this.label = 'Cappuccino',
    this.onPressed,
  });

  final String label;
  final bool selected;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return RawChip(
      onPressed: onPressed,
      backgroundColor: selected ? AppColors.orange : AppColors.white,
      side: BorderSide.none,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.s12),
      ),
      label: Text(
        label,
        style: context.textStyle.titleMedium?.copyWith(
          color: selected ? AppColors.white : AppColors.navyBlue,
          fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
        ),
      ),
    );
  }
}
