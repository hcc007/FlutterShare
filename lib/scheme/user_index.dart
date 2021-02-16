import 'package:flutter/material.dart';
import 'package:flutter_share/utils/json_config.dart';

/// 首页
class UserPageIndex extends StatelessWidget {
  /// 用户 ID 信息
  final String userId;

  /// 构造函数
  const UserPageIndex({Key key, this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //通过这种方式刷新页面
    Map dataInfo = JsonConfig.objectToMap(
        ModalRoute.of(context).settings.arguments
    );

    // TODO: implement build
    return Text('I am use page ${dataInfo['userId']}');
  }
}
