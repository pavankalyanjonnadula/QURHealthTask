class Info {
  int? count;
  int? pages;
  String? next;
  String? prev;

  Info({this.count, this.pages, this.next, this.prev});

  Info.fromJson(Map<String, dynamic> json) {
    count = json["count"];
    pages = json["pages"];
    next = json["next"];
    prev = json["prev"];
  }

  static List<Info> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Info.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["count"] = count;
    data["pages"] = pages;
    data["next"] = next;
    data["prev"] = prev;
    return data;
  }

  Info copyWith({
    int? count,
    int? pages,
    String? next,
    String? prev,
  }) =>
      Info(
        count: count ?? this.count,
        pages: pages ?? this.pages,
        next: next ?? this.next,
        prev: prev ?? this.prev,
      );
}
