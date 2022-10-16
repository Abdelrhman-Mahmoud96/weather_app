import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class CustomSmartRefresher extends StatelessWidget {
  const CustomSmartRefresher(
      {Key? key,
      required this.controller,
      required this.header,
      this.onRefresh,
      required this.customChild})
      : super(key: key);

  final RefreshController controller;
  final Widget header;
  final Function()? onRefresh;
  final Widget customChild;
  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
        controller: controller,
        enablePullDown: true,
        header: header,
        onRefresh: onRefresh,
        child: 
           SingleChildScrollView(            
            child: Padding(
              padding: EdgeInsets.only(top:8.h),
              child: customChild,
            )
          )
        );
  }
}
