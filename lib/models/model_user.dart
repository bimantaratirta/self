class User {
  int? id;
  String? image;
  String? name;
  int? balance;

  User({
    this.id,
    this.image,
    this.name,
    this.balance,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    name = json['name'];
    balance = json['balance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['name'] = name;
    data['balance'] = balance;
    return data;
  }
}
