import 'package:client/models/user.dart';

class Listing {
  int id;
  String title;
  String description;
  String status;
  String startPrice;
  DateTime endDate;
  String imageID;
  User owner;

  Listing(
      {required this.id,
      required this.description,
      required this.status,
      required this.endDate,
      required this.title,
      required this.imageID,
      required this.startPrice,
      required this.owner});

  factory Listing.fromJson(Map<String, dynamic> json) {
    return Listing(
        id: json["id"],
        title: json["title"],
        startPrice: json["start_price"],
        owner: json["owner"], //Check
        imageID: json["image_id"],
        description: json["description"],
        endDate: json["end_date"],
        status: json["status"]);
  }
}
