///  wx_new_friend_model.dart
///
///  Created by iotjin on 2020/09/01.
///  description: 新的朋友 model

class WxNewFriendModel {
  String? title;
  String? subtitle;
  String? img;
  bool? isAdd;

  WxNewFriendModel({
    this.title,
    this.subtitle,
    this.img,
    this.isAdd,
  });

  WxNewFriendModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    subtitle = json['subtitle'];
    img = json['img'];
    isAdd = json['isAdd'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['subtitle'] = this.subtitle;
    data['img'] = this.img;
    data['isAdd'] = this.isAdd;
    return data;
  }
}
