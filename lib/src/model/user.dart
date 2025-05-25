// Define a User model class with JSON serialization
class User {
  final int id;
  final String name;
  final int age;

  User({this.id = 0, this.name = '', this.age = 0});

  User.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      name = json['name'] ?? '',
      age = json['age'] ?? 0;

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'age': age};
  }
}
