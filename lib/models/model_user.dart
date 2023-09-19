import 'dart:typed_data';

class User {
  int? id;
  Uint8List? image;
  String? name;
  double? balance;
  double? income;
  double? expense;

  User({
    this.id,
    this.image,
    this.name,
    this.balance,
    this.income,
    this.expense,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = Uint8List.fromList(json['image']);
    name = json['name'];
    balance = json['balance'];
    income = json['income'];
    expense = json['expense'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['name'] = name;
    data['balance'] = balance;
    data['income'] = income;
    data['expense'] = expense;
    return data;
  }
}
