class Transaction {
  int? id;
  int? userId;
  String? image;
  String? name;
  String? status;
  int? amount;
  String? date;

  Transaction({
    this.id,
    this.userId,
    this.image,
    this.name,
    this.status,
    this.amount,
    this.date,
  });

  Transaction.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    image = json['image'];
    name = json['name'];
    status = json['status'];
    amount = json['amount'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['image'] = image;
    data['name'] = name;
    data['status'] = status;
    data['amount'] = amount;
    data['date'] = date;
    return data;
  }
}
