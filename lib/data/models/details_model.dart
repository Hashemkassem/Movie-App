// ignore_for_file: public_member_api_docs, sort_constructors_first

class DetailsModel {
  DetailsModel(
      {this.adult,
      this.backdropPath,
      this.budget,
      this.genres,
      this.homepage,
      this.id,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.revenue,
      this.runtime,
      this.status,
      this.title,
      this.voteAverage,
      this.voteCount,
      this.originalName});

  bool? adult;
  String? backdropPath;
  int? budget;
  List<Genres>? genres;
  String? homepage;
  int? id;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  int? revenue;
  int? runtime;
  String? status;
  String? title;
  double? voteAverage;
  int? voteCount;
  String? originalName;

  factory DetailsModel.fromJson(Map<String, dynamic> json) {
    return DetailsModel(
      adult: json["adult"],
      backdropPath: json["backdrop_path"],
      budget: json["budget"],
      genres: (json['genres'] as List)
          .map((genre) => Genres.fromJson(genre))
          .toList(),
      //  genres: json['genres'] != null
      //     ? <Genres>[]
      //     : json['genres'].forEach((v) {
      //         genres?.add(Genres.fromJson(v));
      //       }),
      homepage: json["homepage"],
      id: json["id"],
      originalTitle: json["original_title"],
      overview: json["overview"],
      popularity: json["popularity"],
      posterPath: json["poster_path"],
      releaseDate: json["release_date"],
      revenue: json["revenue"],
      runtime: json["runtime"],
      status: json["status"],
      title: json["title"],
      voteAverage: json["vote_average"],
      voteCount: json["vote_count"],
      originalName: json["original_name"],
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json["adult"] = adult;
    json["backdrop_path"] = backdropPath;
    json["budget"] = budget;
    json["genres"] = (genres as List).map((genre) => genre.toJson()).toList();
    json["homepage"] = homepage;
    json["id"] = id;
    json["original_title"] = originalTitle;
    json["overview"] = overview;
    json["popularity"] = popularity;
    json["poster_path"] = posterPath;
    json["release_date"] = releaseDate;
    json["revenue"] = revenue;
    json["runtime"] = runtime;
    json["status"] = status;
    json["title"] = title;
    json["vote_average"] = voteAverage;
    json["vote_count"] = voteCount;
    json["original_name"] = originalName;
    return json;
  }

  DetailsModel copyWith({
    bool? adult,
    String? backdropPath,
    int? budget,
    List<Genres>? genres,
    String? homepage,
    int? id,
    String? originalTitle,
    String? overview,
    double? popularity,
    String? posterPath,
    DateTime? releaseDate,
    int? revenue,
    int? runtime,
    String? status,
    String? title,
    double? voteAverage,
    int? voteCount,
    String? originalName,
  }) {
    return DetailsModel(
      adult: adult ?? this.adult,
      backdropPath: backdropPath ?? this.backdropPath,
      budget: budget ?? this.budget,
      genres: genres ?? this.genres,
      homepage: homepage ?? this.homepage,
      id: id ?? this.id,
      originalTitle: originalTitle ?? this.originalTitle,
      overview: overview ?? this.overview,
      popularity: popularity ?? this.popularity,
      posterPath: posterPath ?? this.posterPath,
      // releaseDate: releaseDate ?? this.releaseDate,
      revenue: revenue ?? this.revenue,
      runtime: runtime ?? this.runtime,
      status: status ?? this.status,
      title: title ?? this.title,
      voteAverage: voteAverage ?? this.voteAverage,
      voteCount: voteCount ?? this.voteCount,
      originalName: originalName ?? this.originalName,
    );
  }
}

class Genres {
  int? id;
  String? name;

  Genres({
    this.id,
    this.name,
  });

  Genres.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Genres copyWith({
    int? id,
    String? name,
  }) {
    return Genres(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['name'] = name;
    return json;
  }
}
