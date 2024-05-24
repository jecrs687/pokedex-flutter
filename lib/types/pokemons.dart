class Pokemons {
  int count;
  String next;
  String previous;
  List<Result> results;

  Pokemons({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });
  factory Pokemons.fromJson(Map<String, dynamic> json) {
    return Pokemons(
      count: json['count'] as int,
      next: json['next'] as String,
      previous: json['previous'] as String,
      results: (json['results'] as List)
          .map((e) => Result(
                name: e['name'] as String,
                url: e['url'] as String,
              ))
          .toList(),
    );
  }
}

class Result {
  String name;
  String url;

  Result({
    required this.name,
    required this.url,
  });
}
