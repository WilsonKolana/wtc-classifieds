import 'package:client/views/upload_listing.dart';
import 'package:flutter/material.dart';

import 'components/connect_account_card.dart';
import 'components/recommended_classifieds.dart';
import 'components/upcoming_auctions.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Classifieds",
          style: _theme.textTheme.headline4?.copyWith(
              fontWeight: FontWeight.bold, color: const Color(0xFF244581)),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              ConnectAccountCard(),
              SectionHeader(
                title: "Recommeded for you",
                leading: "upload",
              ),
              RecomendedClassifieds(),
              SectionHeader(title: "Available auctions", leading: "View All"),
              UpcomingAuctions()
            ],
          ),
        ),
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  final String? leading;

  const SectionHeader({Key? key, required this.title, this.leading})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: _theme.textTheme.headline6?.copyWith(
                fontWeight: FontWeight.bold, color: const Color(0xFF26354E)),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const UploadPage()),
              );
            },
            child: Text(
              leading ?? "",
              style: _theme.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.bold, color: const Color(0xFF204680)),
            ),
          )
        ],
      ),
    );
  }
}
