import 'package:qur_health_assignment/models/info.dart';
import 'package:qur_health_assignment/models/results.dart';

class CharactersResponse {
  Info? info;
  List<Results>? results;

  CharactersResponse({this.info, this.results});

  CharactersResponse.fromJson(Map<String, dynamic> json) {
    info = json["info"] == null ? null : Info.fromJson(json["info"]);
    results = json["results"] == null
        ? null
        : (json["results"] as List).map((e) => Results.fromJson(e)).toList();
  }

  static List<CharactersResponse> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => CharactersResponse.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (info != null) {
      data["info"] = info?.toJson();
    }
    if (results != null) {
      data["results"] = results?.map((e) => e.toJson()).toList();
    }
    return data;
  }

  CharactersResponse copyWith({
    Info? info,
    List<Results>? results,
  }) =>
      CharactersResponse(
        info: info ?? this.info,
        results: results ?? this.results,
      );
}
