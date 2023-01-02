///  jh_text_list.dart
///
///  Created by iotjin on 2020/02/18.
///  description:  带箭头文本列表

import 'package:flutter/material.dart';
import '/project/configs/colors.dart';
import '/base_appbar.dart';

const double _lfSpace = 10.0;
const double _cellHeight = 50.0;
const double _lineHeight = 1.0;
const Color _lineColor = KColors.kLineColor;
const Color _lineDarkColor = KColors.kLineDarkColor;
const Color _cellBgColor = KColors.kCellBgColor;
const Color _cellBgDarkColor = KColors.kCellBgDarkColor;

typedef _CallBack = void Function(int selectIndex, String selectStr);

class JhTextList extends StatelessWidget {
  const JhTextList({
    Key? key,
    this.title = '',
    this.dataArr = const [],
    this.callBack,
  }) : super(key: key);

  final List dataArr;
  final String title;
  final _CallBack? callBack;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title),
      body: _body(),
    );
  }

  _body() {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: dataArr.length,
      itemBuilder: (BuildContext context, int index) {
        return _cell(context, index);
      },
    );
  }

  Widget _cell(context, index) {
    var lineColor = KColors.dynamicColor(context, _lineColor, _lineDarkColor);
    var cellBgColor = KColors.dynamicColor(context, _cellBgColor, _cellBgDarkColor);

    return InkWell(
      child: Container(
        height: _cellHeight,
        color: cellBgColor,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(left: _lfSpace, child: Text(dataArr[index])),
            Positioned(
              right: _lfSpace,
              child: Icon(Icons.arrow_forward_ios, size: 18, color: Color(0xFFC8C8C8)),
            ),
            Positioned(bottom: 0.0, left: _lfSpace, right: 0, child: Container(color: lineColor, height: _lineHeight)),
          ],
        ),
      ),
      onTap: () => callBack?.call(index, dataArr[index]),
    );
  }
}
