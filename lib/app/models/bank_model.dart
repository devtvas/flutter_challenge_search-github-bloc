import 'package:test/app/models/user_github_model.dart';

class BankModel {
  const BankModel({
    required this.fullName,
    required this.htmlUrl,
    required this.owner,
  });

  final String fullName;
  final String htmlUrl;
  final GithubUser owner;

  static BankModel fromJson(dynamic json) {
    return BankModel(
      fullName: json['full_name'] as String,
      htmlUrl: json['html_url'] as String,
      owner: GithubUser.fromJson(json['owner']),
    );
  }
}
