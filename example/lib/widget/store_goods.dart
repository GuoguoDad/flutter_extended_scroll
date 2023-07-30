// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../util/screen_util.dart';
import 'goods_item.dart';

double screenWidth = 0;

Widget storeGoods(BuildContext context) {
  screenWidth = getScreenWidth(context);
  double width = (getScreenWidth(context) - 20) / 2;
  List<Map> goodsList = [
    {
      "imgUrl": "https://m.360buyimg.com/mobilecms/s714x714_jfs/t1/223778/18/6959/168828/622cc318E47c3b663/753cd44c08858430.jpg!q70.dpg.webp",
      "tag": "时尚运动",
      "des1": "活动惊爆价",
      "des2": "实惠好货等你抢",
      "type": "2"
    },
    {
      "imgUrl": "https://m.360buyimg.com/mobilecms/s714x714_jfs/t1/208465/36/8682/93776/618a6339E208f6217/44fbee25f6b7d872.jpg",
      "description": "帅电乔1男休闲运动篮球鞋倒钩TS 女鞋深棕鬼脸",
      "price": "799.00",
      "type": "1"
    },
    {
      "imgUrl": "https://m.360buyimg.com/mobilecms/s1080x1080_jfs/t1/185796/23/23365/154983/625d9644E96e93807/0e30192ad676f8a8.jpg!q70.jpg.webp",
      "tag": "好物集市",
      "des1": "专业运动装备",
      "des2": "运动与你相伴",
      "type": "2"
    },
    {
      "imgUrl": "https://m.360buyimg.com/mobilecms/s714x714_jfs/t1/106053/8/25901/375428/622cc43dE7be3f2c7/8de7c9f9f9691068.jpg",
      "description": "ASICS 亚瑟士 男鞋运动鞋 GEL-VENTURE 7 MX 抓地缓冲越野跑鞋 黑色",
      "price": "590.00",
      "type": "1"
    },
    {
      "imgUrl": "https://m.360buyimg.com/mobilecms/s714x714_jfs/t1/174007/12/4609/59798/607947f3Ed185a0e8/339959c1bb02c110.jpg",
      "description": "塞洛蒙（Salomon）男款 户外运动轻便舒适网布透气排水浅滩涉水溯溪鞋 AMPHIB BOLD",
      "price": "798.00",
      "type": "1"
    },
    {
      "imgUrl": "https://m.360buyimg.com/mobilecms/s714x714_jfs/t1/223761/1/3118/231155/61de4e31E67751289/7a863c20f2dfdb01.jpg",
      "description": "蝴蝶乒乓球鞋 男比赛专业训练鞋防滑透气轻便耐磨鞋",
      "price": "268.60",
      "type": "1"
    },
    {
      "imgUrl": "https://m.360buyimg.com/mobilecms/s714x714_jfs/t1/85379/5/23716/185324/622b6ff4E9c5b48d9/48e7d4d725bb654c.jpg!q70.dpg.webp",
      "description": "乔丹官方旗舰板鞋春新款网透气休闲运动鞋高帮轻便搭扣滑板鞋",
      "price": "205.10",
      "type": "1"
    },
    {
      "imgUrl": "https://m.360buyimg.com/mobilecms/s714x714_jfs/t1/89996/21/25563/131810/622ce8faE08399a9a/0554f25e84207de0.jpg!q70.dpg.webp",
      "description": "yysports 阿迪达斯adidas男鞋女鞋 三叶草 OZWE",
      "price": "809.00",
      "type": "1"
    },
    {
      "imgUrl": "https://m.360buyimg.com/mobilecms/s714x714_jfs/t1/183854/38/19727/543220/611cd169E30d7d836/f043008c71aafcb3.jpg!q70.dpg.webp",
      "description": "帅电乔1男休闲运动篮球鞋倒钩TS 女鞋深棕鬼脸",
      "price": "799.00",
      "type": "1"
    },
    {
      "imgUrl": "https://m.360buyimg.com/mobilecms/s714x714_jfs/t1/146075/32/25809/139065/622b435aE314833fc/b977c681b857c136.jpg!q70.dpg.webp",
      "description": "ASICS 亚瑟士 男鞋运动鞋 GEL-VENTURE 7 MX 抓地缓冲越野跑鞋 黑色",
      "price": "590.00",
      "type": "1"
    },
    {
      "imgUrl": "https://m.360buyimg.com/mobilecms/s714x714_jfs/t1/142532/19/20779/102990/61976e06Ee88d1a31/c14a124344d5b88b.jpg!q70.dpg.webp",
      "description": "帅电乔1男休闲运动篮球鞋倒钩TS 女鞋深棕鬼脸",
      "price": "799.00",
      "type": "1"
    },
    {
      "imgUrl": "https://m.360buyimg.com/mobilecms/s714x714_jfs/t1/137009/10/23801/161776/622cc71eE068ed3fe/f94465f4d2a1a911.jpg!q70.dpg.webp",
      "description": "ASICS 亚瑟士 男鞋运动鞋 GEL-VENTURE 7 MX 抓地缓冲越野跑鞋 黑色",
      "price": "590.00",
      "type": "1"
    },
    {
      "imgUrl": "https://m.360buyimg.com/mobilecms/s714x714_jfs/t1/119098/1/23199/165424/622cc317E2d149455/25323fdd66edf577.jpg!q70.dpg.webp",
      "description": "ASICS亚瑟士 女鞋运动鞋稳定旗舰跑鞋耐磨 GE",
      "price": "1399.00",
      "type": "1"
    },
    {
      "imgUrl": "https://m.360buyimg.com/mobilecms/s714x714_jfs/t1/207289/24/3349/344826/61592344Efc667435/2ef0dac91e137342.jpg!q70.dpg.webp",
      "description": "ASICS 亚瑟士 男鞋运动鞋 GEL-VENTURE 7 MX 抓地缓冲越野跑鞋 黑色",
      "price": "590.00",
      "type": "1"
    },
    {
      "imgUrl": "https://m.360buyimg.com/mobilecms/s714x714_jfs/t1/212981/31/14635/156447/622b42a9Eb150cd2e/2f5292cbcfd99480.jpg!q70.dpg.webp",
      "description": "帅电乔1男休闲运动篮球鞋倒钩TS 女鞋深棕鬼脸",
      "price": "799.00",
      "type": "1"
    },
    {
      "imgUrl": "https://m.360buyimg.com/mobilecms/s461x461_jfs/t1/204996/26/20660/320325/625f5837Eff657349/7bf9ac9a6dccdd5f.jpg!q70.dpg",
      "description": "ASICS 亚瑟士 休闲鞋低帮运动鞋舒适透气 COO",
      "price": "792.00",
      "type": "1"
    }
  ];

  return SliverMasonryGrid.count(
    childCount: goodsList.length,
    crossAxisCount: 2,
    mainAxisSpacing: 10,
    crossAxisSpacing: 0,
    itemBuilder: (context, index) => goodsItem(context, goodsList[index], width),
  );
}
