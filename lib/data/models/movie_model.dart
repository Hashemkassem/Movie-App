// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:json_annotation/json_annotation.dart';

// part 'movie_model.g.dart';

// @JsonSerializable()
// class MovieModel {
//   // @JsonKey(name: 'id')
//   final int? id;
//   // @JsonKey(name: 'title')
//   final String? title;
//   // @JsonKey(name: 'overview')
//   final String? overview;
//   // @JsonKey(name: 'poster_path')
//   final String? posterPath;
//   // @JsonKey(name: 'vote_average')
//   final double? voteAverage;
//   // @JsonKey(name: 'popularity')
//   final double? popularity;
//   // @JsonKey(name: 'vote_count')
//   final int? voteCount;
//   // @JsonKey(name: 'release_date')
//   final String? releaseDate;
//   // @JsonKey(name: 'media_type')
//   // final String mediaType;
//   MovieModel({
//     required this.id,
//     required this.title,
//     required this.overview,
//     required this.posterPath,
//     required this.voteAverage,
//     required this.popularity,
//     required this.voteCount,
//     required this.releaseDate,
//     // required this.mediaType,
//   });

//   factory MovieModel.fromJson(Map<String, dynamic> json) =>
//       _$MovieModelFromJson(json);

//   /// Connect the generated [_$PersonToJson] function to the `toJson` method.
//   Map<String, dynamic> toJson() => _$MovieModelToJson(this);
// }

class MovieModel {
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  String? mediaType;
  bool? video;
  double? voteAverage;
  int? voteCount;
  String? originalName;

  MovieModel(
      {this.backdropPath,
      this.mediaType,
      this.genreIds,
      this.id,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount,
      this.originalName});

  MovieModel.fromJson(Map<String, dynamic> json) {
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'].cast<int>();
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    mediaType = json['media_type'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
    originalName = json["original_name"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['backdropPath'] = backdropPath;
    json['genre_ids'].cast<int>();
    json['id'] = id;
    json['media_type'] = mediaType;
    json['original_language'] = originalLanguage;
    json['original_title'] = originalTitle;
    json['overview'] = overview;
    json['popularity'] = popularity;
    json['poster_path'] = posterPath;
    json['release_date'] = releaseDate;
    json['title'] = title;
    json['video'] = video;
    json['vote_average'] = voteAverage;
    json['vote_count'] = voteCount;
    json["original_name"] = originalName;
    return json;
  }
}
