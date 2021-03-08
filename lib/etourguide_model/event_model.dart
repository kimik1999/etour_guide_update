
class Event{
  int id;
  String name;
  String description;
  String imageUrl;
  String createdDate;
  String startDate;
  String endDate;
  double avgRating;
  int totalFeedback;
  List<String> feedback;

  Event({this.id, this.name, this.description, this.imageUrl, this.createdDate,
      this.startDate, this.endDate, this.avgRating, this.totalFeedback, this.feedback});

  factory Event.fromJson(Map<String, dynamic> json){
    return new Event(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      imageUrl: json['image'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      avgRating: json['rating'],
      totalFeedback: json['totalFeedback']
    );
  }


}