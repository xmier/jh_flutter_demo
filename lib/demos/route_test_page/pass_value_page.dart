import 'package:flutter/material.dart';
import 'package:jhtoast/jhtoast.dart';
import '/jh_common/utils/jh_nav_router_utils.dart';
import '/jh_common/widgets/jh_progress_hud.dart';
import '/project/routes/jh_nav_utils.dart';
import '/base_appbar.dart';
import '/demos/route_test_page/pass_value_page2.dart';

class PassValuePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar('传值'),
      body: _body(context),
    );
  }

  _body(context) {
    var params = {
      'passValue': '123',
      'isBool': true,
      'array': [1, 2, 3],
    };

    return Scrollbar(
        child: SingleChildScrollView(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('以下是JhNavUtils方式(基于fluro路由封装) - 推荐'),
            ElevatedButton(
              child: Text('带参数跳转带回传刷新 - pushNamedResult'),
              onPressed: () {
                params['type'] = '1';

                JhNavUtils.pushNamedResult(context, 'PassValuePage2', params, (returnData) {
                  print('回传的值====' + returnData.toString());
                  if (returnData['isRefresh'] == true) {
                    _requestData();
                  }
                });
              },
            ),
            ElevatedButton(
              child: Text('带参数跳转带回传 - pushNamedResult'),
              onPressed: () {
                params['type'] = '2';

                JhNavUtils.pushNamedResult(context, 'PassValuePage2', params, (returnData) {
                  print('回传的值====' + returnData.toString());
                  JhToast.showText(context, msg: '返回的参数: ${returnData.toString()}');
                });
              },
            ),
            ElevatedButton(
              child: Text('带参数跳转 - pushNamed'),
              onPressed: () {
                params['type'] = '3';

                JhNavUtils.pushNamed(context, 'PassValuePage2', arguments: params);
              },
            ),
            Text('以下是flutter原生方式'),
            ElevatedButton(
              child: Text('带参数跳转带回传 - Navigator.push'),
              onPressed: () {
                params['type'] = '4';

                // 普通路由跳转传值带回传
                // Navigator.push(context, MaterialPageRoute(builder: (context) => (PassValuePage2(params))))
                //     .then((returnData) {
                //   print('回传的值====' + returnData.toString());
                //   JhToast.showText(context, msg: '返回的参数: ${returnData.toString()}');
                // });

                // 效果同上，基于Navigator封装
                JhNavRouterUtils.pushNamedResult(context, PassValuePage2(params), (returnData) {
                  print('回传的值====' + returnData.toString());
                  JhToast.showText(context, msg: '返回的参数: ${returnData.toString()}');
                });
              },
            ),
            ElevatedButton(
              child: Text('带参数跳转 - Navigator.push'),
              onPressed: () {
                params['type'] = '5';

                // 普通路由跳转传值，以下三种效果一样
                // Navigator.push(context, MaterialPageRoute(builder: (context) => (PassValuePage2(params)))); // 普通路由
                // Navigator.of(context).push(MaterialPageRoute(builder: (context) => (PassValuePage2(params)))); // 普通路由

                // 效果同上，基于Navigator封装
                JhNavRouterUtils.push(context, PassValuePage2(params));
              },
            ),
            ElevatedButton(
              child: Text('带参数跳转(渐隐转场动画) - Navigator.push'),
              onPressed: () {
                params['type'] = '6';

                // 渐隐转场动画
                Navigator.of(context)
                    .push(PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 500), //动画时间为500毫秒
                        pageBuilder: (context, animation1, animation2) {
                          return FadeTransition(
                            opacity: animation1,
                            child: PassValuePage2(params),
                          );
                        }))
                    .then((returnData) {
                  print('回传的值====' + returnData.toString());
                  JhToast.showText(context, msg: '返回的参数: ${returnData.toString()}');
                });
              },
            ),
            ElevatedButton(
              child: Text('带参数跳转带回传 - Navigator.pushNamed'),
              onPressed: () {
                params['type'] = '7';

                // 命名路由跳转传值带回传
                Navigator.pushNamed(context, 'PassValuePage3', arguments: params).then((returnData) {
                  print('回传的值====' + returnData.toString());
                  JhToast.showText(context, msg: '返回的参数: ${returnData.toString()}');
                });
              },
            ),
          ]),
    ));
  }

  void _requestData() {
    JhProgressHUD.showLoadingText();
    Future.delayed(Duration(seconds: 1), () {
      JhProgressHUD.hide();
    });
  }
}
