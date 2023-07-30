// Flutter imports:
import 'package:flutter/material.dart';
import '../component/asset_image.dart';
import '../style/common_style.dart';
import '../util/screen_util.dart';

double screenWidth = 0;

Widget addressInfo(BuildContext context) {
  screenWidth = getScreenWidth(context);

  Map selectInfo = {
    "colorId": "color1",
    "colorName": "黑灰色/红色",
    "thumb": "https://m.360buyimg.com/n2/jfs/t1/212471/24/17530/169099/625d9642Eadb21db3/f5c28554c39fee6d.jpg",
    "imgList": [
      "https://m.360buyimg.com/mobilecms/s1080x1080_jfs/t1/212471/24/17530/169099/625d9642Eadb21db3/f5c28554c39fee6d.jpg!q70.jpg.webp",
      "https://m.360buyimg.com/mobilecms/s1080x1080_jfs/t1/223092/16/13147/109176/623043b7Ec33b6057/8dff30acead53213.jpg!q70.jpg.webp",
      "https://m.360buyimg.com/mobilecms/s1080x1080_jfs/t1/217344/6/14891/89067/623043b7E49c2bf31/1c8f4ba0ccf38c9e.jpg!q70.jpg.webp",
      "https://m.360buyimg.com/mobilecms/s1080x1080_jfs/t1/145881/30/24164/150428/623043b7E8fb57fea/44bdb9081eaec2be.jpg!q70.jpg.webp",
      "https://m.360buyimg.com/mobilecms/s1080x1080_jfs/t1/85372/28/21455/69456/623043b7Ef403bd0a/8ca83cf7694ebd07.jpg!q70.jpg.webp",
      "https://m.360buyimg.com/mobilecms/s1080x1080_jfs/t1/87488/39/23761/210846/623043b8E15396993/e71af88949e071ed.jpg!q70.jpg.webp",
      "https://m.360buyimg.com/mobilecms/s1080x1080_jfs/t1/185539/31/21780/117681/6230217cE99cb7265/4de912b7b8ae3bfe.jpg!q70.jpg.webp"
    ]
  };
  List<String> tagList = ["买满300减40", "满199减20", "满49减1"];

  return Container(
    width: getScreenWidth(context) - 24,
    margin: const EdgeInsets.only(top: 10),
    padding: const EdgeInsets.all(10),
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        rowItem("选择", "已选：${selectInfo["colorName"]}, 42, 1件", 1, true, null),
        rowItem("送至", "江苏省南京市江宁区东山街道丰泽路118号中粮鸿云", 1, true, "今天17:00前完成下单，预计明天送达"),
        rowItem("运费", "店铺单笔订单不满199元，收费5元(请以提交订单时为准)", 2, false, null),
        SizedBox(
          height: 30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: tagList.map((e) => tagLabel(e)).toList(),
          ),
        )
      ],
    ),
  );
}

Widget rowItem(String label, String text, int line, bool showArrow, String? des) {
  return Container(
    margin: const EdgeInsets.only(bottom: 20),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: TextStyle(color: CommonStyle.color8B8C8A, fontSize: 18)),
                Container(
                  width: screenWidth - 110,
                  margin: const EdgeInsets.only(left: 10),
                  child: Text(
                    text,
                    maxLines: line,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
            showArrow ? assetImage("images/ic_arrow_right.png", 8, 24) : Container()
          ],
        ),
        des != null
            ? Container(
                margin: const EdgeInsets.only(left: 10),
                child: Text(
                  des,
                  style: const TextStyle(fontSize: 18),
                ),
              )
            : Container()
      ],
    ),
  );
}

Widget tagLabel(String label) {
  return Text(label, style: TextStyle(fontSize: 16, color: CommonStyle.color8B8C8A));
}
