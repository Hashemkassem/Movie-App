// ignore_for_file: public_member_api_docs, sort_constructors_first

// ignore_for_file: non_constant_identifier_names

class ReviewsModel {
  String? author;
  String? content;
  String? createdAt;
  String? url;

  ReviewsModel(
    this.author,
    this.content,
    this.createdAt,
    this.url,
  );

  ReviewsModel.fromJson(Map<String, dynamic> json) {
    author = json['author'];
    content = json['content'];
    createdAt = json['created_at'];
    url = json['url'];
  }

  ReviewsModel copyWith({
    String? author,
    String? content,
    String? createdAt,
    String? url,
  }) {
    return ReviewsModel(
      author ?? this.author,
      content ?? this.content,
      createdAt ?? this.createdAt,
      url ?? this.url,
    );
  }
}
