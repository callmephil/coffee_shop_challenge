import 'package:coffee_shop_challenge/constants/constants.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    this.image = AppAssets.latteSpecial,
    this.name = 'Cappuccino',
    this.subtitle = 'Our Specialty',
    this.price = 4.99,
    this.rating = 4.8,
    this.onPressed,
  });

  final String image;
  final String name;
  final String subtitle;
  final double price;
  final double rating;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizes.s16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ProductImage(image: image, rating: rating),
          ProductDetails(
            name: name,
            subtitle: subtitle,
            price: price,
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}

class ProductImage extends StatelessWidget {
  const ProductImage({
    super.key,
    required this.image,
    required this.rating,
  });

  final String image;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSizes.s4).copyWith(
        bottom: AppSizes.zero,
      ),
      child: Center(
        child: Stack(
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 300) {
                  // TODO: add dynamic images
                  return Image.asset(AppAssets.cappuccinoLarge);
                }

                return Image.asset(image);
              },
            ),
            RatingBox(rating: rating),
          ],
        ),
      ),
    );
  }
}

class RatingBox extends StatelessWidget {
  const RatingBox({
    super.key,
    required this.rating,
  });

  final double rating;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.16),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(AppSizes.s16),
            bottomRight: Radius.circular(AppSizes.s16),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.s8,
            vertical: AppSizes.s4,
          ),
          child: Row(
            children: [
              const Icon(
                Icons.star,
                color: AppColors.yellowDark,
                size: AppSizes.s10,
              ),
              const SizedBox(width: AppSizes.s2),
              Text(
                rating.toString(),
                style: context.textStyle.labelSmall?.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductDetails extends StatelessWidget {
  const ProductDetails({
    super.key,
    required this.name,
    required this.subtitle,
    required this.price,
    required this.onPressed,
  });

  final String name;
  final String subtitle;
  final double price;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSizes.s12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            name,
            style: context.textStyle.bodyLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            subtitle,
            style: context.textStyle.bodySmall?.copyWith(
              color: AppColors.lightGrey,
            ),
          ),
          const SizedBox(height: AppSizes.s8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$ $price',
                style: context.textStyle.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.navyBlue,
                ),
              ),
              AppIconButton(onPressed: onPressed),
            ],
          ),
        ],
      ),
    );
  }
}

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    super.key,
    this.dimensions = AppSizes.s32,
    this.iconSize = AppSizes.s16,
    this.backgroundColor = AppColors.orange,
    this.onPressed,
  });

  final double dimensions;
  final double iconSize;
  final Color backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: dimensions,
      child: IconButton.filled(
        iconSize: iconSize,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return Colors.grey.shade300;
              }

              return backgroundColor;
            },
          ),
          shape: MaterialStateProperty.all(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(AppSizes.s10),
              ),
            ),
          ),
        ),
        icon: const Icon(Icons.add, color: AppColors.white),
        onPressed: onPressed,
      ),
    );
  }
}
