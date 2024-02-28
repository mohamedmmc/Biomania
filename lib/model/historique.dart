class HistoriqueModel {
  String? id;
  String name;
  String image;
  String job;
  String date;
  String price;

  HistoriqueModel({
    this.id,
    required this.name,
    required this.image,
    required this.job,
    required this.date,
    required this.price,

  });

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'image': image,
      'job':job,
      'date':date,
      'price':price,
    };
  }

  factory HistoriqueModel.fromJson(dynamic json) {
    return HistoriqueModel(
      name: json['name'],
      image: json['image'],
      job: json['job'],
      date: json['date'],
      price: json['price'],

    );
  }

}
