import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:example/extension/extensions.dart';
import '../component/asset_image.dart';

Widget skuInfo(BuildContext context) {
  double thumbWidth = 78;
  double screenWidth = MediaQuery.sizeOf(context).width;

  List<Map> bannerList = [
    {
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
    },
    {
      "colorId": "color2",
      "colorName": "蓝色/黄色",
      "thumb": "https://m.360buyimg.com/mobilecms/s1080x1080_jfs/t1/185796/23/23365/154983/625d9644E96e93807/0e30192ad676f8a8.jpg!q70.jpg.webp",
      "imgList": [
        "https://m.360buyimg.com/mobilecms/s1080x1080_jfs/t1/185796/23/23365/154983/625d9644E96e93807/0e30192ad676f8a8.jpg!q70.jpg.webp",
        "https://m.360buyimg.com/mobilecms/s1080x1080_jfs/t1/117422/24/20800/87701/62295f18Edbec5730/a1a9fae9bed57523.jpg!q70.jpg.webp",
        "https://m.360buyimg.com/mobilecms/s1080x1080_jfs/t1/122414/38/23345/79829/62295f18E274d9ffa/b9d2b41d33493999.jpg!q70.jpg.webp",
        "https://m.360buyimg.com/mobilecms/s1080x1080_jfs/t1/147359/11/22931/135736/62295f19Edd661297/4cac5b0ea0c5a0da.jpg!q70.jpg.webp",
        "https://m.360buyimg.com/mobilecms/s1080x1080_jfs/t1/89066/12/22981/53911/62295f19Eff96ea37/a93e6f167964bcfb.jpg!q70.jpg.webp",
        "https://m.360buyimg.com/mobilecms/s1080x1080_jfs/t1/214240/2/14478/182817/62295f19Eb7afb2f5/11e72ba025a0da3c.jpg!q70.jpg.webp",
        "https://m.360buyimg.com/mobilecms/s1080x1080_jfs/t1/97439/8/24039/117681/622842a3E760fbb99/e4ad2acca9283634.jpg!q70.jpg.webp"
      ]
    }
  ];
  Map selectInfo = bannerList[0];
  Map goodsInfo = {
    "originalPrice": "890.00",
    "specialPrice": "810",
    "tagList": ["买满300减40", "满199减20", "满49减1"],
    "goodsName": "ASICS亚瑟士 2022春夏男鞋稳定支持经典跑鞋舒适回弹运动鞋 GT-2000 10 蓝色/黄色",
    "appraiseList": [
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
    ]
  };

  return Container(
    width: screenWidth - 24,
    margin: const EdgeInsets.only(top: 10),
    padding: const EdgeInsets.fromLTRB(10, 12, 10, 12),
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: thumbWidth,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "${bannerList.length}色可选",
                style: TextStyle(color: "#545454".toColor(), fontSize: 18),
              ),
              Expanded(
                flex: 1,
                child: ListView.builder(
                  itemCount: bannerList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    bool isSelect = bannerList[index]["colorId"] == selectInfo["colorId"];

                    return GestureDetector(
                      // onTap: () => store.dispatch(ChangeCurrentInfoAction(bannerList[index])),
                      child: Container(
                        width: thumbWidth,
                        height: thumbWidth,
                        margin: const EdgeInsets.only(left: 5, right: 5),
                        decoration: BoxDecoration(
                          border: Border.all(color: isSelect ? "#FF1520".toColor() : Colors.transparent, width: 0.5),
                        ),
                        child: CachedNetworkImage(
                          height: thumbWidth,
                          width: thumbWidth,
                          imageUrl: bannerList[index]["thumb"],
                          placeholder: (context, url) => assetImage("images/default.png", thumbWidth, thumbWidth),
                          errorWidget: (context, url, error) => assetImage("images/default.png", thumbWidth, thumbWidth),
                          fit: BoxFit.fill,
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 5, bottom: 5),
          child: Text(
            "￥${goodsInfo["specialPrice"]}",
            textAlign: TextAlign.left,
            style: const TextStyle(
              color: Colors.red,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(
          goodsInfo["goodsName"],
          maxLines: 2,
          textAlign: TextAlign.left,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    ),
  );
}
