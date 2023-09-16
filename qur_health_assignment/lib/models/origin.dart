
class Origin {
    String? name;
    String? url;

    Origin({this.name, this.url});

    Origin.fromJson(Map<String, dynamic> json) {
        name = json["name"];
        url = json["url"];
    }

    static List<Origin> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => Origin.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data["name"] = name;
        data["url"] = url;
        return data;
    }

    Origin copyWith({
        String? name,
        String? url,
    }) => Origin(
        name: name ?? this.name,
        url: url ?? this.url,
    );
}