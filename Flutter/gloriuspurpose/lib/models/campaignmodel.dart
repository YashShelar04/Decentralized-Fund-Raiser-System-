class CampaignModel {
  CampaignModel({
    required this.imgUrl,
    required this.category,
    required this.title,
    required this.description,
    required this.accountAddress,
    required this.isAimAmt,
    required this.aim,
    required this.startDate,
    required this.endDate,
    required this.hashTags,
    required this.collected,
    required this.userUid,
    required this.campaignId,
    required this.isLive,
    required this.outputImg,
    required this.outputText,
  });

  String? imgUrl;
  String? category;
  String? title;
  String? description;
  String? accountAddress;
  bool isAimAmt;
  int? aim;
  String? startDate;
  String? endDate;
  List<dynamic> hashTags;
  int? collected;
  String? userUid;
  String? campaignId;
  bool? isLive;
  List<dynamic> outputImg;
  String? outputText;

  factory CampaignModel.fromJson(Map<String, dynamic> json){
    return CampaignModel(
      imgUrl: json["imgUrl"],
      category: json["category"],
      title: json["title"],
      description: json["description"],
      accountAddress: json["accountAddress"],
      isAimAmt: json["isAimAmt"],
      aim: json["aim"],
      startDate: json["startDate"],
      endDate: json["endDate"],
      hashTags: json["hashTags"] == null ? [] : List<dynamic>.from(json["hashTags"]!.map((x) => x)),
      collected: json["collected"],
      userUid: json["userUid"],
      campaignId: json["campaignId"],
      isLive: json["isLive"],
      outputImg: json["outputImg"] == null ? [] : List<dynamic>.from(json["outputImg"]!.map((x) => x)),
      outputText: json["outputText"],
    );
  }

  Map<String, dynamic> toJson() => {
    "imgUrl": imgUrl,
    "category": category,
    "title": title,
    "description": description,
    "accountAddress": accountAddress,
    "isAimAmt": isAimAmt,
    "aim": aim,
    "startDate": startDate,
    "endDate": endDate,
    "hashTags": hashTags.map((x) => x).toList(),
    "collected": collected,
    "userUid": userUid,
    "campaignId": campaignId,
    "isLive": isLive,
    "outputImg": outputImg.map((x) => x).toList(),
    "outputText": outputText,
  };

}
