// ignore_for_file: public_member_api_docs, sort_constructors_first

class VideoModel {
  String? key;
  VideoModel({
    required this.key,
  });
  VideoModel.fromJson(Map<String, dynamic> json) {
    key = json['key'];
  }
}
