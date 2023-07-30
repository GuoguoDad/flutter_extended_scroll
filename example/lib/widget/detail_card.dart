// Flutter imports:
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../component/asset_image.dart';
import '../style/common_style.dart';
import '../util/screen_util.dart';

Widget detailCard(BuildContext context, Key key) {
  double screenWidth = getScreenWidth(context);
  List<String> introductionList = [
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
  ];

  return SliverToBoxAdapter(
    child: Container(
      key: key,
      margin: const EdgeInsets.only(left: 10, top: 10, right: 10),
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
              "详情",
              style: TextStyle(color: CommonStyle.color545454),
            ),
          ),
          Column(
            children: introductionList
                .map((url) => CachedNetworkImage(
                      width: screenWidth - 40,
                      imageUrl: url,
                      placeholder: (context, url) => assetImage("images/default.png", screenWidth - 40, 100),
                      errorWidget: (context, url, error) => assetImage("images/default.png", screenWidth - 40, 100),
                      fit: BoxFit.fill,
                    ))
                .toList(),
          )
        ],
      ),
    ),
  );
}
