import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../component/asset_image.dart';
import '../component/group_grid_view.dart';
import '../style/common_style.dart';
import '../util/screen_util.dart';

double imgWidth = 60;
double headWidth = 40;
double screenWidth = 0;

Widget appraiseInfo(BuildContext context, Key key) {
  screenWidth = getScreenWidth(context);
  List<Map> list = [
    {
      "headerUrl": "https://ik.imagekit.io/guoguodad/mall/WechatIMG17.jpeg",
      "userName": "大**行",
      "content": "外观颜值:外形很好看 别具一格再增加点颜色选择就更好了",
      "type": 1,
      "color": "蓝色/黄色",
      "size": "44",
      "imgList": ["https://ik.imagekit.io/guoguodad/mall/iShot2022-04-22_11.00.41.png"]
    },
    {
      "headerUrl": "https://ik.imagekit.io/guoguodad/mall/header.jpg",
      "userName": "梦**仙",
      "content": "第一次买亚瑟士的跑鞋，可以说很惊喜了，穿着很舒服，回弹也很到位，跑鞋非常专业！",
      "type": 1,
      "color": "黑灰色/红色",
      "size": "42",
      "imgList": ["https://ik.imagekit.io/guoguodad/mall/iShot2022-04-22_11.01.00.png", "https://ik.imagekit.io/guoguodad/mall/iShot2022-04-22_11.01.00.png"]
    }
  ];

  Map detailInfo = {
    "hdzq": "https://img13.360buyimg.com/cms/jfs/t1/197792/33/22051/102624/625d0076Ef4252b55/fdf3b1d52374f37d.jpg.dpg",
    "dnyx": "https://img11.360buyimg.com/cms/jfs/t1/131411/22/20981/284862/6259240fE7980bcbe/b2b9db04abe679f9.jpg.dpg",
    "introductionList": [
      "https://img30.360buyimg.com/popWareDetail/jfs/t1/130765/11/26608/146901/624d5c6aEe590921f/b8bfe5686b57e194.jpg.dpg",
      "https://img30.360buyimg.com/popWareDetail/jfs/t1/129566/36/28066/71317/624d5c69E0b9ba09c/a5f6f70467c6b0a6.jpg.dpg",
      "https://img30.360buyimg.com/popWareDetail/jfs/t1/109170/17/27071/49050/624d5c69Ed53303f8/bec3690c3ea0ed3a.jpg.dpg",
      "https://img30.360buyimg.com/popWareDetail/jfs/t1/189785/35/22461/262616/624d5c69Ee2835623/e6377e50fa1e1b2f.jpg.dpg",
      "https://img30.360buyimg.com/popWareDetail/jfs/t1/121994/38/26242/215472/624d5c69E93b2b771/9eb4e5c1dced910f.jpg.dpg",
      "https://img30.360buyimg.com/popWareDetail/jfs/t1/200046/18/20726/293757/624d5c69Ea7628ea7/47fa0c49693dcc71.jpg.dpg",
      "https://img30.360buyimg.com/popWareDetail/jfs/t1/116482/24/23676/268365/624d5c69Eeb48ab6c/4e6006511b0cc5d6.jpg.dpg",
      "https://img30.360buyimg.com/popWareDetail/jfs/t1/99540/22/26782/8746/624d5c68E08308a06/404b26a0d0a18103.jpg.dpg",
      "https://img30.360buyimg.com/popWareDetail/jfs/t1/205726/37/20745/137848/624d5c68E0daebe01/afd9b75c4ff05764.jpg.dpg",
      "https://img30.360buyimg.com/popWareDetail/jfs/t1/205726/37/20745/137848/624d5c68E0daebe01/afd9b75c4ff05764.jpg.dpg",
      "https://img30.360buyimg.com/popWareDetail/jfs/t1/216582/30/16606/127427/624d5c68E619d2d6d/c8cf40cac78e0532.jpg.dpg",
      "https://img30.360buyimg.com/popWareDetail/jfs/t1/166575/9/22244/214537/624d5c69E28b09fb7/1e52c37e4d539d0b.jpg.dpg",
      "https://img30.360buyimg.com/popWareDetail/jfs/t1/87859/27/25402/137998/624d5c68E6d8dc293/e0dc610050c48363.jpg.dpg",
      "https://img30.360buyimg.com/popWareDetail/jfs/t1/213761/40/16381/110431/624d5c68Eb09a4fca/acc39177f635cb84.jpg.dpg",
      "https://img30.360buyimg.com/popWareDetail/jfs/t1/213761/40/16381/110431/624d5c68Eb09a4fca/acc39177f635cb84.jpg.dpg"
    ],
    "serviceList": ["https://img30.360buyimg.com/sku/jfs/t1/118720/15/16298/415064/5f487872E0d237cd1/283084254c9e270a.jpg.dpg"]
  };

  Widget appraiseList = GroupGridView(
    padding: EdgeInsets.zero,
    physics: const NeverScrollableScrollPhysics(),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, mainAxisSpacing: 5, crossAxisSpacing: 5),
    sectionCount: list.length,
    itemInSectionCount: (int section) => list[section]["imgList"].length,
    headerForSection: (section) => Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: CachedNetworkImage(
                  height: headWidth,
                  width: headWidth,
                  imageUrl: list[section]["headerUrl"],
                  placeholder: (context, url) => assetImage("images/default.png", headWidth, headWidth),
                  errorWidget: (context, url, error) => assetImage("images/default.png", headWidth, headWidth),
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10),
                child: Text(list[section]["userName"], style: const TextStyle(fontSize: 16)),
              )
            ],
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(top: 10),
            child: Text(list[section]["content"], style: const TextStyle(fontSize: 16)),
          )
        ],
      ),
    ),
    itemInSectionBuilder: (BuildContext context, IndexPath indexPath) {
      return SizedBox(
        width: imgWidth,
        height: imgWidth,
        child: CachedNetworkImage(
          height: imgWidth,
          width: imgWidth,
          imageUrl: list[indexPath.section]["imgList"][indexPath.index],
          placeholder: (context, url) => assetImage("images/default.png", imgWidth, imgWidth),
          errorWidget: (context, url, error) => assetImage("images/default.png", imgWidth, imgWidth),
          fit: BoxFit.fill,
        ),
      );
    },
    footerForSection: (section) => Container(
      margin: const EdgeInsets.only(top: 5, bottom: 5),
      child: Text(list[section]["color"], style: const TextStyle(fontSize: 16)),
    ),
  );

  return SliverToBoxAdapter(
    child: Container(
      color: CommonStyle.colorF5F5F5,
      child: Column(children: [
        Container(
          width: getScreenWidth(context) - 24,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                key: key,
                margin: const EdgeInsets.only(bottom: 10),
                child: const Text(
                  "评价",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: getScreenWidth(context) - 20,
                height: list.length * 240,
                child: appraiseList,
              ),
              Container(
                width: 160,
                height: 42,
                margin: EdgeInsets.only(left: getScreenWidth(context) / 2 - 80),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  border: Border.all(color: Colors.grey, width: 1),
                ),
                child: const Text("查看全部评价"),
              )
            ],
          ),
        ),
        itemCard("活动专区", detailInfo["hdzq"], 260),
        Container(
          height: 10,
          width: screenWidth,
          color: CommonStyle.colorF5F5F5,
        ),
        itemCard("店铺优选", detailInfo["dnyx"], 500)
      ]),
    ),
  );
}

Widget itemCard(String title, String url, double imgHeight) {
  return Container(
    width: screenWidth - 20,
    padding: const EdgeInsets.all(10),
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 5),
          child: Text(
            title,
            style: TextStyle(color: CommonStyle.color545454),
          ),
        ),
        CachedNetworkImage(
          height: imgHeight,
          width: screenWidth - 40,
          imageUrl: url,
          placeholder: (context, url) => assetImage("images/default.png", imgWidth, imgWidth),
          errorWidget: (context, url, error) => assetImage("images/default.png", imgWidth, imgWidth),
          fit: BoxFit.fill,
        )
      ],
    ),
  );
}
