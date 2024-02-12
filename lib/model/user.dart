class UserModel {
  String? id;
  String name;
  String username;
  String password;
  String email;
  String address;
  String city;
  int postalCode;
  String country;
  String role;
  int? matriculeFiscale;
  String? passport;
  int? numFreelancer;
  bool? isActivated;
  bool? isValidated;

  UserModel({
    this.id,
    required this.name,
    required this.username,
    required this.password,
    required this.email,
    required this.address,
    required this.city,
    required this.postalCode,
    required this.country,
    required this.role,
    this.matriculeFiscale,
    this.passport,
    this.numFreelancer,
    this.isActivated,
    this.isValidated,
  });

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'username': username,
      'password': password,
      'email': email,
      'address': address,
      'city': city,
      'postalCode': postalCode,
      'country': country,
      'role': role,
      'MatriculeFiscale': matriculeFiscale,
      'Passport': passport,
      'numFreelancer': numFreelancer,
      'isActivated': isActivated,
      'isValidated': isValidated,
    };
  }

  factory UserModel.fromJson(dynamic json) {
    return UserModel(
      name: json['name'],
      username: json['username'],
      password: json['password'],
      email: json['email'],
      address: json['address'],
      city: json['city'],
      postalCode: json['postalCode'],
      country: json['country'],
      role: json['role'],
      matriculeFiscale: json['MatriculeFiscale'] ?? -1,
      passport: json['passport'] ?? '',
      numFreelancer: json['numFreelancer'] ?? -1,
    );
  }

}
