// To parse this JSON data, do
//
//     final metadataInfo = metadataInfoFromJson(jsonString);

import 'dart:convert';

MetadataInfo metadataInfoFromJson(String str) =>
    MetadataInfo.fromJson(json.decode(str));

String metadataInfoToJson(MetadataInfo data) => json.encode(data.toJson());

class MetadataInfo {
  Status? status;
  Map<String, List<Datum>>? data;

  MetadataInfo({
    this.status,
    this.data,
  });

  factory MetadataInfo.fromJson(Map<String, dynamic> json) => MetadataInfo(
        status: json["status"] == null ? null : Status.fromJson(json["status"]),
        data: Map.from(json["data"]!)
              .map((k, v) => MapEntry<String, List<Datum>>(
                k, List<Datum>.from(
                  ((v is List) ? v : [v] ).map((x) => Datum.fromJson(x))
                    )
                  )
                ),
      );

  Map<String, dynamic> toJson() => {
        "status": status?.toJson(),
        "data": Map.from(data!).map((k, v) => MapEntry<String, dynamic>(
            k, List<dynamic>.from(v.map((x) => x.toJson())))),
      };
}

class Datum {
  int? id;
  String? name;
  String? symbol;
  String? category;
  String? description;
  String? slug;
  String? logo;
  String? subreddit;
  String? notice;
  List<String>? tags;
  List<String>? tagNames;
  List<String>? tagGroups;
  Urls? urls;
  dynamic platform;
  String? dateAdded;
  String? twitterUsername;
  int? isHidden;
  String? dateLaunched;
  List<ContractAddress>? contractAddress;
  dynamic selfReportedCirculatingSupply;
  dynamic selfReportedTags;
  dynamic selfReportedMarketCap;
  bool? infiniteSupply;

  Datum({
    this.id,
    this.name,
    this.symbol,
    this.category,
    this.description,
    this.slug,
    this.logo,
    this.subreddit,
    this.notice,
    this.tags,
    this.tagNames,
    this.tagGroups,
    this.urls,
    this.platform,
    this.dateAdded,
    this.twitterUsername,
    this.isHidden,
    this.dateLaunched,
    this.contractAddress,
    this.selfReportedCirculatingSupply,
    this.selfReportedTags,
    this.selfReportedMarketCap,
    this.infiniteSupply,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        symbol: json["symbol"],
        category: json["category"],
        description: json["description"],
        slug: json["slug"],
        logo: json["logo"],
        subreddit: json["subreddit"],
        notice: json["notice"],
        tags: json["tags"] == null
            ? []
            : List<String>.from(json["tags"]!.map((x) => x)),
        tagNames: json["tag-names"] == null
            ? []
            : List<String>.from(json["tag-names"]!.map((x) => x)),
        tagGroups: json["tag-groups"] == null
            ? []
            : List<String>.from(json["tag-groups"]!.map((x) => x)),
        urls: json["urls"] == null ? null : Urls.fromJson(json["urls"]),
        platform: json["platform"],
        dateAdded: json["date_added"],
        twitterUsername: json["twitter_username"],
        isHidden: json["is_hidden"],
        dateLaunched: json["date_launched"],
        contractAddress: json["contract_address"] == null
            ? []
            : List<ContractAddress>.from(json["contract_address"]!
                .map((x) => ContractAddress.fromJson(x))),
        selfReportedCirculatingSupply: json["self_reported_circulating_supply"],
        selfReportedTags: json["self_reported_tags"],
        selfReportedMarketCap: json["self_reported_market_cap"],
        infiniteSupply: json["infinite_supply"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "symbol": symbol,
        "category": category,
        "description": description,
        "slug": slug,
        "logo": logo,
        "subreddit": subreddit,
        "notice": notice,
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
        "tag-names":
            tagNames == null ? [] : List<dynamic>.from(tagNames!.map((x) => x)),
        "tag-groups": tagGroups == null
            ? []
            : List<dynamic>.from(tagGroups!.map((x) => x)),
        "urls": urls?.toJson(),
        "platform": platform,
        "date_added": dateAdded,
        "twitter_username": twitterUsername,
        "is_hidden": isHidden,
        "date_launched": dateLaunched,
        "contract_address": contractAddress == null
            ? []
            : List<dynamic>.from(contractAddress!.map((x) => x.toJson())),
        "self_reported_circulating_supply": selfReportedCirculatingSupply,
        "self_reported_tags": selfReportedTags,
        "self_reported_market_cap": selfReportedMarketCap,
        "infinite_supply": infiniteSupply,
      };
}

class ContractAddress {
  String? contractAddress;
  Platform? platform;

  ContractAddress({
    this.contractAddress,
    this.platform,
  });

  factory ContractAddress.fromJson(Map<String, dynamic> json) =>
      ContractAddress(
        contractAddress: json["contract_address"],
        platform: json["platform"] == null
            ? null
            : Platform.fromJson(json["platform"]),
      );

  Map<String, dynamic> toJson() => {
        "contract_address": contractAddress,
        "platform": platform?.toJson(),
      };
}

class Platform {
  String? name;
  Coin? coin;

  Platform({
    this.name,
    this.coin,
  });

  factory Platform.fromJson(Map<String, dynamic> json) => Platform(
        name: json["name"],
        coin: json["coin"] == null ? null : Coin.fromJson(json["coin"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "coin": coin?.toJson(),
      };
}

class Coin {
  String? id;
  String? name;
  String? symbol;
  String? slug;

  Coin({
    this.id,
    this.name,
    this.symbol,
    this.slug,
  });

  factory Coin.fromJson(Map<String, dynamic> json) => Coin(
        id: json["id"],
        name: json["name"],
        symbol: json["symbol"],
        slug: json["slug"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "symbol": symbol,
        "slug": slug,
      };
}

class Urls {
  List<String>? website;
  List<String>? twitter;
  List<String>? messageBoard;
  List<String>? chat;
  List<dynamic>? facebook;
  List<String>? explorer;
  List<String>? reddit;
  List<String>? technicalDoc;
  List<String>? sourceCode;
  List<String>? announcement;

  Urls({
    this.website,
    this.twitter,
    this.messageBoard,
    this.chat,
    this.facebook,
    this.explorer,
    this.reddit,
    this.technicalDoc,
    this.sourceCode,
    this.announcement,
  });

  factory Urls.fromJson(Map<String, dynamic> json) => Urls(
        website: json["website"] == null
            ? []
            : List<String>.from(json["website"]!.map((x) => x)),
        twitter: json["twitter"] == null
            ? []
            : List<String>.from(json["twitter"]!.map((x) => x)),
        messageBoard: json["message_board"] == null
            ? []
            : List<String>.from(json["message_board"]!.map((x) => x)),
        chat: json["chat"] == null
            ? []
            : List<String>.from(json["chat"]!.map((x) => x)),
        facebook: json["facebook"] == null
            ? []
            : List<dynamic>.from(json["facebook"]!.map((x) => x)),
        explorer: json["explorer"] == null
            ? []
            : List<String>.from(json["explorer"]!.map((x) => x)),
        reddit: json["reddit"] == null
            ? []
            : List<String>.from(json["reddit"]!.map((x) => x)),
        technicalDoc: json["technical_doc"] == null
            ? []
            : List<String>.from(json["technical_doc"]!.map((x) => x)),
        sourceCode: json["source_code"] == null
            ? []
            : List<String>.from(json["source_code"]!.map((x) => x)),
        announcement: json["announcement"] == null
            ? []
            : List<String>.from(json["announcement"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "website":
            website == null ? [] : List<dynamic>.from(website!.map((x) => x)),
        "twitter":
            twitter == null ? [] : List<dynamic>.from(twitter!.map((x) => x)),
        "message_board": messageBoard == null
            ? []
            : List<dynamic>.from(messageBoard!.map((x) => x)),
        "chat": chat == null ? [] : List<dynamic>.from(chat!.map((x) => x)),
        "facebook":
            facebook == null ? [] : List<dynamic>.from(facebook!.map((x) => x)),
        "explorer":
            explorer == null ? [] : List<dynamic>.from(explorer!.map((x) => x)),
        "reddit":
            reddit == null ? [] : List<dynamic>.from(reddit!.map((x) => x)),
        "technical_doc": technicalDoc == null
            ? []
            : List<dynamic>.from(technicalDoc!.map((x) => x)),
        "source_code": sourceCode == null
            ? []
            : List<dynamic>.from(sourceCode!.map((x) => x)),
        "announcement": announcement == null
            ? []
            : List<dynamic>.from(announcement!.map((x) => x)),
      };
}

class Status {
  String? timestamp;
  int? errorCode;
  dynamic errorMessage;
  int? elapsed;
  int? creditCount;
  dynamic notice;

  Status({
    this.timestamp,
    this.errorCode,
    this.errorMessage,
    this.elapsed,
    this.creditCount,
    this.notice,
  });

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        timestamp: json["timestamp"],
        errorCode: json["error_code"],
        errorMessage: json["error_message"],
        elapsed: json["elapsed"],
        creditCount: json["credit_count"],
        notice: json["notice"],
      );

  Map<String, dynamic> toJson() => {
        "timestamp": timestamp,
        "error_code": errorCode,
        "error_message": errorMessage,
        "elapsed": elapsed,
        "credit_count": creditCount,
        "notice": notice,
      };
}
