## extended_scroll package for flutter.

     make method ensureVisible support offsetTop

## Getting Started

Add the package to your pubspec.yaml:

 ```yaml
 extended_scroll: ^3.2.0
 ```
## example
详细见example

In your dart file, import the library:

 ```Dart
import 'package:extended_scroll/extended_scroll.dart';
 ``` 


```dart
class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  static const String name = "/detailPage";

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late final ExtendedScrollController _scrollController;
  late final RefreshController _refreshController;

  bool isTabClicked = false;

  //good、comment、detail、betterGoods card keys
  final cardKeys = <GlobalKey>[
    GlobalKey(debugLabel: 'detail_card_0'),
    GlobalKey(debugLabel: 'detail_card_1'),
    GlobalKey(debugLabel: 'detail_card_2'),
    GlobalKey(debugLabel: 'detail_card_3')
  ];

  @override
  void initState() {
    _scrollController = ExtendedScrollController();
    _refreshController = RefreshController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<AppState>(
      onInit: (store) async {
        await store.dispatch(InitPageAction());
      },
      onDispose: (store) {
        store.dispatch(ChangeTopTabIndexAction(0));
      },
      builder: (context, store) {
        bool isLoading = store.state.detailPageState.isLoading;

        List<Widget> stackWidgets = [];
        if (isLoading) {
          stackWidgets.add(loadingWidget(context));
        } else {
          stackWidgets.add(NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification notification) {
              double distance = notification.metrics.pixels;
              store.dispatch(ChangePageScrollYAction(distance));
              
              if (isTabClicked) return false;
              int newIndex = findFirstVisibleItemIndex(cardKeys, context);
              store.dispatch(ChangeTopTabIndexAction(newIndex));
              return false;
            },
            child: Container(
              child: SmartRefresher(
                controller: _refreshController,
                enablePullUp: true,
                enablePullDown: false,
                onLoading: () async {
                  store.dispatch(LoadMoreAction(
                    store.state.detailPageState.pageNum + 1,
                        () => loadMoreSuccess(_refreshController),
                        () => loadMoreFail(_refreshController),
                  ));
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
            ),
          ));
        }

        stackWidgets.add(
          Positioned(
            top: 0,
            left: 0,
            child: tabHeader(
              context,
              onChange: (index) {
                isTabClicked = true;
                store.dispatch(ChangeTopTabIndexAction(index));
                scroll2PositionByTabIndex(index);
              },
            ),
          ),
        );

        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.dark,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Scaffold(
                  body: Stack(
                    children: stackWidgets,
                  ),
                  floatingActionButton: BackToTop(_scrollController),
                ),
              ),
              fixedBottom(context)
            ],
          ),
        );
      },
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

```.
