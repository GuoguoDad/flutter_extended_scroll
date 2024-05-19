import 'package:example/extension/extensions.dart';
import 'package:example/util/screen_util.dart';
import 'package:example/widget/appraise_Info.dart';
import 'package:example/widget/detail_card.dart';
import 'package:example/widget/goods_Info.dart';
import 'package:example/widget/store_goods.dart';
import 'package:example/widget/store_goods_header.dart';
import 'package:example/widget/tab_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_extended_scroll/flutter_extended_scroll.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final ExtendedScrollController _scrollController;

  double pageY = 0;
  int currentIndex = 0;

  //是否是floatingHeader中的tab点击
  bool isTabClicked = false;

  //商品、评论、详情、同店好货锚点key
  final cardKeys = <GlobalKey>[
    GlobalKey(debugLabel: 'detail_card_0'),
    GlobalKey(debugLabel: 'detail_card_1'),
    GlobalKey(debugLabel: 'detail_card_2'),
    GlobalKey(debugLabel: 'detail_card_3')
  ];

  @override
  void initState() {
    _scrollController = ExtendedScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> stackWidgets = [];

    stackWidgets.add(
      NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          setState(() {
            pageY = notification.metrics.pixels;
          });
          //监听滚动，选中对应的tab
          if (isTabClicked) return false;
          setState(() {
            currentIndex = findFirstVisibleItemIndex(cardKeys, context);
          });
          return false;
        },
        child: ExtendedCustomScrollView(
          controller: _scrollController,
          slivers: [
            goodsInfo(context, cardKeys[0]),
            appraiseInfo(context, cardKeys[1]),
            detailCard(context, cardKeys[2]),
            storeGoodsHeader(context, cardKeys[3]),
            storeGoods(context)
          ],
        ),
      ),
    );

    stackWidgets.add(
      Positioned(
        top: 0,
        left: 0,
        child: TabHeader(
          pageY: pageY,
          currentIndex: currentIndex,
          onChange: (index) {
            isTabClicked = true;
            setState(() {
              currentIndex = index;
            });
            scroll2PositionByTabIndex(index);
          },
        ),
      ),
    );

    return Scaffold(
      body: Container(
        color: "#F5F5F5".toColor(),
        child: Stack(
          children: stackWidgets,
        ),
      ),
    );
  }

  void scroll2PositionByTabIndex(int index) {
    RenderSliverToBoxAdapter? keyRenderObject = cardKeys[index].currentContext?.findAncestorRenderObjectOfType<RenderSliverToBoxAdapter>();
    if (keyRenderObject != null) {
      _scrollController.position
          .ensureVisible(keyRenderObject, offsetTop: 42 + getStatusHeight(context), duration: const Duration(milliseconds: 300), curve: Curves.linear)
          .then((value) => isTabClicked = false);
    }
  }

  //找到当前页面第一个可见的item的索引
  int findFirstVisibleItemIndex(List<GlobalKey<State<StatefulWidget>>> cardKeys, BuildContext context) {
    int i = 0;
    for (; i < cardKeys.length; i++) {
      RenderSliverToBoxAdapter? keyRenderObject = cardKeys[i].currentContext?.findAncestorRenderObjectOfType<RenderSliverToBoxAdapter>();
      if (keyRenderObject != null) {
        final dy = (keyRenderObject.parentData as SliverPhysicalParentData).paintOffset.dy;
        if (dy > 42 + getStatusHeight(context)) {
          break;
        }
      }
    }
    final newIndex = i == 0 ? 0 : i - 1;
    return newIndex;
  }
}
