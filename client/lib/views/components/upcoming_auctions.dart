import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class UpcomingAuctions extends StatelessWidget {
  const UpcomingAuctions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        UpcomingAuctionItemCard(asset: "assets/images/04.jpeg", title: "Mouse"),
        UpcomingAuctionItemCard(
            asset: "assets/images/02.jpeg", title: "Dell Laptop"),
        UpcomingAuctionItemCard(
            asset: "assets/images/03.jpeg", title: "Mechnical Keyboard"),
        UpcomingAuctionItemCard(
            asset: "assets/images/05.jpeg", title: "Macbook Pro"),
        UpcomingAuctionItemCard(
            asset: "assets/images/05.jpeg", title: "Macbook Not Pro"),
      ],
    );
  }
}

class UpcomingAuctionItemCard extends StatelessWidget {
  final String asset;
  final String title;

  const UpcomingAuctionItemCard(
      {Key? key, required this.asset, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                offset: const Offset(0, 2.0),
                blurRadius: 6.0,
              )
            ]),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.asset(asset, height: 45)),
                const SizedBox(height: 4),
                Text(
                  "Jan 22",
                  style: _theme.textTheme.headline6?.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF244581)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 2.0),
                  child: Text(
                    "07:00 PM",
                    style: _theme.textTheme.headline6?.copyWith(
                        fontSize: 9,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF244581)),
                  ),
                )
              ],
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: _theme.textTheme.headline6?.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF26354E)),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const PillIndicator(label: "Live"),
                    Text(
                      "202 units",
                      style: _theme.textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF244581),
                          fontSize: 9),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Iconsax.location,
                        size: 14, color: Color(0xFF244581)),
                    const SizedBox(width: 4),
                    Text("Johannesburg",
                        style: _theme.textTheme.bodySmall?.copyWith(
                            color: const Color(0xFF244581), fontSize: 9))
                  ],
                )
              ],
            ),
          ],
        ));
  }
}

class PillIndicator extends StatelessWidget {
  final String label;
  const PillIndicator({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(4),
      margin: const EdgeInsets.only(right: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: const Color(0xFFF1F5FE)),
      child: Text(
        label,
        style: _theme.textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: const Color(0xFF244581),
            fontSize: 9),
      ),
    );
  }
}
