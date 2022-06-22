// To parse this JSON data, do
//
//     final homeDm = homeDmFromJson(jsonString);

import 'dart:convert';

HomeDm homeDmFromJson(String str) => HomeDm.fromJson(json.decode(str));

String homeDmToJson(HomeDm data) => json.encode(data.toJson());

class HomeDm {
    HomeDm({
        this.totalCount,
        this.incompleteResults,
        this.items,
    });

    int? totalCount;
    bool? incompleteResults;
    List<Item>? items;

    factory HomeDm.fromJson(Map<String, dynamic> json) => HomeDm(
        totalCount: json["total_count"],
        incompleteResults: json["incomplete_results"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "total_count": totalCount,
        "incomplete_results": incompleteResults,
        "items": List<dynamic>.from(items!.map((x) => x.toJson())),
    };
}

class Item {
    Item({
        this.id,
        this.name,
        this.fullName,
        this.owner,
        this.htmlUrl,
        this.description,
        this.createdAt,
        this.updatedAt,
        this.gitUrl,
        this.size,
        this.stargazersCount,
        this.watchersCount,
        this.language,
    });

    int ?id;
    String? name;
    String? fullName;
    Owner ?owner;
    String ?htmlUrl;
    String? description;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? gitUrl;
    int? size;
    int? stargazersCount;
    int? watchersCount;
    String? language;

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        name: json["name"],
        fullName: json["full_name"],
        owner: Owner.fromJson(json["owner"]),
        htmlUrl: json["html_url"],
        description: json["description"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        gitUrl: json["git_url"],
        size: json["size"],
        stargazersCount: json["stargazers_count"],
        watchersCount: json["watchers_count"],
        language: json["language"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "full_name": fullName,
        "owner": owner!.toJson(),
        "html_url": htmlUrl,
        "description": description,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "git_url": gitUrl,
        "size": size,
        "stargazers_count": stargazersCount,
        "watchers_count": watchersCount,
        "language": language,
    };
}

class Owner {
    Owner({
        this.login,
        this.avatarUrl,
    });

    String ?login;
    String ?avatarUrl;

    factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        login: json["login"],
        avatarUrl: json["avatar_url"],
    );

    Map<String, dynamic> toJson() => {
        "login": login,
        "avatar_url": avatarUrl,
    };
}
