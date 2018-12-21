class CreditsModel {
  final int id;
  final List<Cast> cast;

  CreditsModel({this.id, this.cast});

  CreditsModel.fromJson(Map<String, dynamic> json) 
      : id = json['id'],
      cast = (json['cast'] as List).map((v) => Cast.fromJson(v)).toList();
}

class Cast {
  final int castId;
  final String character;
  final String creditId;
  final int gender;
  final int id;
  final String name;
  final int order;
  final String profilePath;

  Cast(
      {this.castId,
      this.character,
      this.creditId,
      this.gender,
      this.id,
      this.name,
      this.order,
      this.profilePath});

  Cast.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        castId = json['cast_id'],
        character = json['character'],
        creditId = json['credit_id'],
        gender = json['gender'],
        name = json['name'],
        order = json['order'],
        profilePath = json['profile_path'];
}
