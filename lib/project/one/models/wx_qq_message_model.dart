///  wx_qq_message_model.dart
///
///  Created by iotjin on 2020/09/09.
///  description: QQ邮箱提醒 model

class WxQQMessageModel {
  String? title;
  String? subtitle;

  WxQQMessageModel({
    this.title,
    this.subtitle,
  });

  WxQQMessageModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    subtitle = json['subtitle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['subtitle'] = this.subtitle;
    return data;
  }
}
