// Flutter imports:
import 'package:example/widget/sku_Info.dart';
import 'package:flutter/cupertino.dart';

import 'address_Info.dart';
import 'img_slider.dart';

Widget goodsInfo(BuildContext context, Key key) {
  return SliverToBoxAdapter(
    child: Column(
      key: key,
      children: [imgSlider(context), skuInfo(context), addressInfo(context)],
    ),
  );
}
