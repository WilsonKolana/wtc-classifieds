import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class RecomendedClassifieds extends StatelessWidget {
  const RecomendedClassifieds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: const [
          RecommendedItemCard(asset: "assets/images/02.jpeg"),
          RecommendedItemCard(asset: "assets/images/03.jpeg"),
          RecommendedItemCard(asset: "assets/images/04.jpeg"),
          RecommendedItemCard(asset: "assets/images/05.jpeg"),
        ],
      ),
    );
  }
}

class RecommendedItemCard extends StatelessWidget {
  final String asset;
  const RecommendedItemCard({
    Key? key,
    required this.asset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);

    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        width: 160,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                offset: const Offset(0, 2.0),
                blurRadius: 6.0,
              )
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12)),
                child: Image.asset(asset)),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Item",
                    style: _theme.textTheme.headline6?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF244581),
                        fontSize: 12),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    "67,890 km | Wreck",
                    style: _theme.textTheme.bodySmall
                        ?.copyWith(color: const Color(0xFF244581), fontSize: 9),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "R 192,323",
                            style: _theme.textTheme.bodySmall?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF244581),
                                fontSize: 9),
                          ),
                          const SizedBox(width: 2),
                          const Icon(Icons.info_rounded,
                              size: 12, color: Color(0xFF9FAAB9))
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Iconsax.timer_1,
                              size: 12, color: Color(0xFF52A33B)),
                          const SizedBox(width: 2),
                          Text(
                            "2d 10h",
                            style: _theme.textTheme.bodySmall?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF52A33B),
                                fontSize: 9),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
