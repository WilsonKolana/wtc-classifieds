import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ConnectAccountCard extends StatelessWidget{
  const ConnectAccountCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData _mediaQuery = MediaQuery.of(context);
    ThemeData _theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF6286C5),
            Color(0xFF2A4C89),
          ]
        )
      ),
      width: _mediaQuery.size.width,
      height: 120,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0xFF2A4C89)
                ),
                child: const Icon(Iconsax.user, color: Colors.white, size: 20)
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Connect account",
                    style: _theme.textTheme.headline5?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  Text(
                    " Find Deals. Make Money.",
                    style: _theme.textTheme.caption?.copyWith(color: const Color(0xFFA2B3D0)),
                  )
                ],
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.only(top: 8, bottom: 8, left: 8, right: 12),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(28), bottomLeft: Radius.circular(28)),
              color: Color(0xFF5270A1)
            ),
            child: const Icon(Iconsax.arrow_right_1, color: Colors.white, size: 20)
          ),
        ],
      ),
    );
  }

}