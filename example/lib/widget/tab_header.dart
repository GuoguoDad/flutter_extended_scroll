import 'package:flutter/material.dart';

import '../component/asset_image.dart';
import '../style/common_style.dart';
import '../util/screen_util.dart';

typedef ValueCallback<T> = void Function(T value);

class TabHeader extends StatefulWidget {
  const TabHeader({required this.onChange, required this.pageY, required this.currentIndex, super.key});

  final ValueCallback<int> onChange;
  final double pageY;
  final int currentIndex;

  @override
  State<TabHeader> createState() => _TabHeaderState();
}

class _TabHeaderState extends State<TabHeader> {
  @override
  Widget build(BuildContext context) {
    double statusHeight = getStatusHeight(context);
    double opacity = 0 + widget.pageY * 0.01;
    if (opacity < 0) opacity = 0;
    if (opacity > 1) opacity = 1;

    Widget tabItem(String name, int index) {
      return GestureDetector(
        onTap: () => widget.onChange(index),
        child: Opacity(
          opacity: opacity,
          child: Container(
            height: 42,
            color: Colors.transparent,
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black87,
                    decoration: TextDecoration.none,
                  ),
                ),
                Container(
                  height: 3,
                  width: 30,
                  margin: const EdgeInsets.only(top: 5),
                  color: widget.currentIndex == index ? CommonStyle.themeColor : Colors.transparent,
                )
              ],
            ),
          ),
        ),
      );
    }

    return Container(
      height: 42 + statusHeight,
      color: opacity == 1 ? Colors.white : Colors.transparent,
      width: getScreenWidth(context),
      padding: EdgeInsets.only(top: statusHeight),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Expanded(
            flex: 3,
            child: Container(
              alignment: Alignment.center,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  tabItem("商品", 0),
                  tabItem("评价", 1),
                  tabItem("详情", 2),
                  tabItem("推荐", 3),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                assetImage("images/ic_share_black.png", 22, 22),
                Container(
                  margin: const EdgeInsets.only(left: 10, right: 5),
                  child: assetImage("images/ic_ellipsis_black.png", 22, 22),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
