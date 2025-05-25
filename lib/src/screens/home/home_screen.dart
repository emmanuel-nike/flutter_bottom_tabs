import 'package:flutter_bottom_tabs/src/config/themes.dart';
import 'package:flutter_bottom_tabs/src/screens/components/common/question_option.dart';
import 'package:flutter_bottom_tabs/src/screens/components/icons/chevron_down.dart';
import 'package:flutter_bottom_tabs/src/screens/components/icons/mic_icon.dart';
import 'package:flutter_bottom_tabs/src/screens/components/icons/time_icon.dart';
import 'package:flutter_bottom_tabs/src/screens/components/icons/user_icon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeScreen extends ConsumerStatefulWidget {
  static String tag = '/HomeScreen';

  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends ConsumerState<HomeScreen> {
  bool reachedTheEnd = false;
  bool atTheBottom = false;
  bool atTheTop = true;
  final GlobalKey _scaffoldKey = GlobalKey<ScaffoldState>();
  final RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );

  final _questionData = {
    "question": "What is your favorite time of the day?",
    "options": [
      "The peace in the early mornings",
      "The magical golden hours",
      "Wind-down time after dinners",
      "The serenity past midnight",
    ],
  };

  int? selectedIndex;

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  init() async {
    //_scrollController.addListener(_handleScrolling);
    //await Future.delayed(Duration(seconds: 10));
    //ref.read(newsFeedNotifierProvider.notifier).pretenSaveNewsFeed();
  }

  void _onSelectOption(int index) {
    print("Selected option index: $index");
    setState(() {
      selectedIndex = index;
    });
  }

  void _onRefresh() async {
    // monitor network fetch
  }

  void _onLoading() async {
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    // await ref.read(newsFeedNotifierProvider.notifier).getNewsFeeds();
    // final nfProvider = ref.read(newsFeedNotifierProvider);
    // if (nfProvider is NewsFeedErrorState) {
    //   _refreshController.loadFailed();
    // } else if (nfProvider is NewsFeedState && nfProvider.hasMoreData) {
    //   _refreshController.loadComplete();
    // } else {
    //   _refreshController.loadNoData();
    // }
  }

  void _handleScrolling() {
    // if (isEnd &&
    //     !(ref.watch(newsFeedNotifierProvider) as NewsFeedState).isLoading) {
    //   _onLoading();
    //   print("getting bottom feeds");
    // }
    // if (isTop &&
    //     !(ref.watch(newsFeedNotifierProvider) as NewsFeedState).isLoading) {
    //   ref.watch(newsFeedNotifierProvider.notifier).getNewsFeeds(reset: true);
    //   print("getting top feeds");
    // }
  }

  @override
  Widget build(BuildContext context) {
    //final newsFeeds = ref.watch(newsFeedProvider);
    return Scaffold(
      key: _scaffoldKey,
      body: Column(
        children: [
          Expanded(
            flex: 7,
            child: Container(
              padding: EdgeInsets.only(top: 50),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/video.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Stroll Bonfire",
                                    style: TextStyle(
                                      color: Color(0xFFCCC8FF),
                                      fontSize: 34,
                                      fontWeight: FontWeight.w700,
                                      shadows: [
                                        Shadow(
                                          blurRadius: 20.0, // shadow blur
                                          color: Colors.black45, // shadow color
                                          offset: Offset(
                                            1.0,
                                            1.0,
                                          ), // how much shadow will be shown
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  InkWell(
                                    onTap: () {
                                      // Handle profile icon tap
                                      print("Profile icon tapped");
                                    },
                                    child: ChevronDownIcon(),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  TimeIcon(),
                                  SizedBox(width: 10),
                                  Text(
                                    "22h 00m",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  UserIcon(),
                                  Text(
                                    "103",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.only(top: 10, left: 35),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withOpacity(0.1),
                            Colors.black.withOpacity(0.1),
                            Colors.black.withOpacity(0.4),
                            Colors.black.withOpacity(0.6),
                            Colors.black.withOpacity(0.8),
                            Colors.black,
                            Colors.black,
                            Colors.black,
                            Colors.black,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundImage: AssetImage(
                              "assets/images/profile_image.png",
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 50),
                                Text(
                                  "Angelina, 28",
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Flexible(
                                  child: Text(
                                    "What is your favorite time of the day?",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                  child: Text(
                    "\"Mine is definitely the peace in the morning.\"",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.italic,
                      color: Color(0xFFCBC9FF),
                    ),
                  ),
                ),

                Expanded(
                  child: Column(
                    children: [
                      SizedBox(height: 10.0),
                      Row(
                        children: [
                          Expanded(
                            child: QuestionOption(
                              text: _questionData.options[0],
                              index: 0,
                              isSelected: selectedIndex == 0,
                              onPress: () => _onSelectOption(0),
                            ),
                          ),
                          Expanded(
                            child: QuestionOption(
                              text: _questionData.options[1],
                              index: 1,
                              isSelected: selectedIndex == 1,
                              onPress: () => _onSelectOption(1),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        children: [
                          Expanded(
                            child: QuestionOption(
                              text: _questionData.options[2],
                              index: 2,
                              isSelected: selectedIndex == 2,
                              onPress: () => _onSelectOption(2),
                            ),
                          ),
                          Expanded(
                            child: QuestionOption(
                              text: _questionData["options"]?[3],
                              index: 3,
                              isSelected: selectedIndex == 3,
                              onPress: () => _onSelectOption(3),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.0),
                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Pick your option. \nSee who has a similar mind.",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      RawMaterialButton(
                        onPressed: () {},
                        elevation: 2.0,
                        constraints: BoxConstraints(minWidth: 0.0),
                        padding: EdgeInsets.all(15.0),
                        shape: CircleBorder(
                          side: BorderSide(
                            color: Color(0xFF8B88EF),
                            width: 3.0,
                          ),
                        ),
                        child: MicIcon(color: Color(0xFF8B88EF)),
                      ),
                      SizedBox(width: 10.0),
                      RawMaterialButton(
                        onPressed: () {},
                        elevation: 2.0,
                        constraints: BoxConstraints(minWidth: 0.0),
                        padding: EdgeInsets.all(10.0),
                        fillColor: Color(0xFF8B88EF),
                        shape: CircleBorder(
                          side: BorderSide(
                            color: Color(0xFF8B88EF),
                            width: 3.0,
                          ),
                        ),
                        child: Icon(
                          Icons.arrow_forward,
                          color: Theme.of(context).scaffoldBackgroundColor,
                          size: 35.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
