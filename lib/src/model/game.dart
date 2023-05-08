class MovieModel {
  final String? url;
  final String? name;
  final String? isbn;
  final List<dynamic>? authors;
  final int? numberOfPages;
  final String? publisher;
  final String? country;
  final String? mediaType;
  final String? released;
  final List<dynamic>? characters;
  final List<dynamic>? povCharacters;
  const MovieModel(
      {this.url,
      this.name,
      this.isbn,
      this.authors,
      this.numberOfPages,
      this.publisher,
      this.country,
      this.mediaType,
      this.released,
      this.characters,
      this.povCharacters});
  MovieModel copyWith(
      {String? url,
      String? name,
      String? isbn,
      List<dynamic>? authors,
      int? numberOfPages,
      String? publisher,
      String? country,
      String? mediaType,
      String? released,
      List<dynamic>? characters,
      List<dynamic>? povCharacters}) {
    return MovieModel(
        url: url ?? this.url,
        name: name ?? this.name,
        isbn: isbn ?? this.isbn,
        authors: authors ?? this.authors,
        numberOfPages: numberOfPages ?? this.numberOfPages,
        publisher: publisher ?? this.publisher,
        country: country ?? this.country,
        mediaType: mediaType ?? this.mediaType,
        released: released ?? this.released,
        characters: characters ?? this.characters,
        povCharacters: povCharacters ?? this.povCharacters);
  }

  Map<String, Object?> toJson() {
    return {
      'url': url,
      'name': name,
      'isbn': isbn,
      'authors': authors,
      'numberOfPages': numberOfPages,
      'publisher': publisher,
      'country': country,
      'mediaType': mediaType,
      'released': released,
      'characters': characters,
      'povCharacters': povCharacters
    };
  }

  static MovieModel fromJson(Map<String, Object?> json) {
    return MovieModel(
        url: json['url'] == null ? null : json['url'] as String,
        name: json['name'] == null ? null : json['name'] as String,
        isbn: json['isbn'] == null ? null : json['isbn'] as String,
        authors:
            json['authors'] == null ? null : json['authors'] as List<dynamic>,
        numberOfPages:
            json['numberOfPages'] == null ? null : json['numberOfPages'] as int,
        publisher:
            json['publisher'] == null ? null : json['publisher'] as String,
        country: json['country'] == null ? null : json['country'] as String,
        mediaType:
            json['mediaType'] == null ? null : json['mediaType'] as String,
        released: json['released'] == null ? null : json['released'] as String,
        characters: json['characters'] == null
            ? null
            : json['characters'] as List<dynamic>,
        povCharacters: json['povCharacters'] == null
            ? null
            : json['povCharacters'] as List<dynamic>);
  }

  @override
  String toString() {
    return '''GameModel(
                url:$url,
name:$name,
isbn:$isbn,
authors:$authors,
numberOfPages:$numberOfPages,
publisher:$publisher,
country:$country,
mediaType:$mediaType,
released:$released,
characters:$characters,
povCharacters:$povCharacters
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is MovieModel &&
        other.runtimeType == runtimeType &&
        other.url == url &&
        other.name == name &&
        other.isbn == isbn &&
        other.authors == authors &&
        other.numberOfPages == numberOfPages &&
        other.publisher == publisher &&
        other.country == country &&
        other.mediaType == mediaType &&
        other.released == released &&
        other.characters == characters &&
        other.povCharacters == povCharacters;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, url, name, isbn, authors, numberOfPages,
        publisher, country, mediaType, released, characters, povCharacters);
  }
}
