class BankModel {
  final String? id;
  final String? name;
  BankModel({this.id, this.name});

  factory BankModel.fromJson(Map<String, dynamic> json) {
    return BankModel(
      id: json['id'],
      name: json['name'],
    );
  }
}
