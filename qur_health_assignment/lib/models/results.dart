
import 'package:qur_health_assignment/models/location.dart';
import 'package:qur_health_assignment/models/origin.dart';

class Results {
    int? id;
    String? name;
    String? status;
    String? species;
    String? type;
    String? gender;
    Origin? origin;
    Location? location;
    String? image;
    List<String>? episode;
    String? url;
    String? created;

    Results({this.id, this.name, this.status, this.species, this.type, this.gender, this.origin, this.location, this.image, this.episode, this.url, this.created});

    Results.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        name = json["name"];
        status = json["status"];
        species = json["species"];
        type = json["type"];
        gender = json["gender"];
        origin = json["origin"] == null ? null : Origin.fromJson(json["origin"]);
        location = json["location"] == null ? null : Location.fromJson(json["location"]);
        image = json["image"];
        episode = json["episode"] == null ? null : List<String>.from(json["episode"]);
        url = json["url"];
        created = json["created"];
    }

    static List<Results> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => Results.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data["id"] = id;
        data["name"] = name;
        data["status"] = status;
        data["species"] = species;
        data["type"] = type;
        data["gender"] = gender;
        if(origin != null) {
            data["origin"] = origin?.toJson();
        }
        if(location != null) {
            data["location"] = location?.toJson();
        }
        data["image"] = image;
        if(episode != null) {
            data["episode"] = episode;
        }
        data["url"] = url;
        data["created"] = created;
        return data;
    }

    Results copyWith({
        int? id,
        String? name,
        String? status,
        String? species,
        String? type,
        String? gender,
        Origin? origin,
        Location? location,
        String? image,
        List<String>? episode,
        String? url,
        String? created,
    }) => Results(
        id: id ?? this.id,
        name: name ?? this.name,
        status: status ?? this.status,
        species: species ?? this.species,
        type: type ?? this.type,
        gender: gender ?? this.gender,
        origin: origin ?? this.origin,
        location: location ?? this.location,
        image: image ?? this.image,
        episode: episode ?? this.episode,
        url: url ?? this.url,
        created: created ?? this.created,
    );
}