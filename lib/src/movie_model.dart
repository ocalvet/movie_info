class Movie {
  final int id;
  final String title;
  final String originalTitle;
  final String releaseDate;
  final String overview;
  // final int voteCount;
  // final bool video;
  // final double voteAverage;
  // final double popularity;
  // final String posterPath;
  // final String originalLanguage;
  // final List<int> genreIds;
  // final String backdropPath;
  // final bool adult;

  Movie({
      this.id,
      this.title,
      this.originalTitle,
      this.overview,
      this.releaseDate,
    // this.voteCount,
    //   this.video,
    //   this.voteAverage,
    //   this.popularity,
    //   this.posterPath,
    //   this.originalLanguage,
    //   this.genreIds,
    //   this.backdropPath,
    //   this.adult,
      });

  Movie.fromJson(Map<String, dynamic> json)
      : 
        id = json['id'],
        title = json['title'],
        originalTitle = json['original_title'],
        overview = json['overview'],
        releaseDate = json['release_date'];
      // voteCount = json['vote_count'],
      //   video = json['video'],
      //   voteAverage = json['vote_average'],
      //   popularity = json['popularity'],
      //   posterPath = json['poster_path'],
      //   originalLanguage = json['original_language'],
      //   genreIds = json['genre_ids'].cast<int>(),
      //   backdropPath = json['backdrop_path'],
      //   adult = json['adult'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['original_title'] = this.originalTitle;
    data['overview'] = this.overview;
    data['release_date'] = this.releaseDate;
    // data['vote_count'] = this.voteCount;
    // data['video'] = this.video;
    // data['vote_average'] = this.voteAverage;
    // data['popularity'] = this.popularity;
    // data['poster_path'] = this.posterPath;
    // data['original_language'] = this.originalLanguage;
    // data['genre_ids'] = this.genreIds;
    // data['backdrop_path'] = this.backdropPath;
    // data['adult'] = this.adult;
    return data;
  }
}
