
class Location {
    String? name;
    String? url;

    Location({this.name, this.url});

    Location.fromJson(Map<String, dynamic> json) {
        name = json["name"];
        url = json["url"];
    }

    static List<Location> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => Location.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data["name"] = name;
        data["url"] = url;
        return data;
    }

    Location copyWith({
        String? name,
        String? url,
    }) => Location(
        name: name ?? this.name,
        url: url ?? this.url,
    );
}