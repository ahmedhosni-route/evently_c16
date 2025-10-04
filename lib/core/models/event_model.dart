class EventModel {
  String id;
  String categoryId;
  String title;
  String desc;
  String image;
  String date;
  String time;
  bool isFav;

  EventModel(
      {required this.id,
        required this.title,
        required this.categoryId,
        required this.time,
        required this.date,
        required this.image,
         this.isFav = false,
        required this.desc});

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "categoryId": categoryId,
      "title": title,
      "desc": desc,
      "image": image,
      "time": time,
      "date": date,
      "isFav":isFav
    };
  }

  factory EventModel.fromJson(dynamic json) {
    return EventModel(
        id: json["id"],
        categoryId: json["categoryId"],
        title: json["title"],
        time: json["time"],
        date: json["date"],
        isFav: json["isFav"]??false,
        image: json["image"],
        desc: json["desc"]);
  }
}
