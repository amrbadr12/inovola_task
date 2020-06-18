import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inovolatask/constants.dart';
import 'package:inovolatask/providers/hike_model_provider.dart';
import 'package:inovolatask/repos/hike_repo.dart';
import 'package:inovolatask/reusable_widgets/course_reusable_widgets/hike_page.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

class CourseScreen extends StatefulWidget {
  @override
  _CourseScreenState createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  ScrollController _controller;
  bool _silverCollapsed = false;

  @override
  void initState() {
    initializeDateFormatting("ar_SA", null);
    super.initState();
    _controller = ScrollController();
    _controller.addListener(() {
      if (_controller.offset > MediaQuery.of(context).size.height * 0.3 &&
          !_controller.position.outOfRange) {
        if (!_silverCollapsed) {
          _silverCollapsed = true;
          setState(() {});
        }
      }
      if (_controller.offset <= MediaQuery.of(context).size.height * 0.3 &&
          !_controller.position.outOfRange) {
        if (_silverCollapsed) {
          _silverCollapsed = false;
          setState(() {});
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ChangeNotifierProvider(
            create: (context) => HikeModelProvider(HikeRepository()),
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomScrollView(
                  controller: _controller,
                  slivers: <Widget>[
                    Consumer<HikeModelProvider>(
                        builder: (context, snapshot, _) {
                      return SliverAppBar(
                          actions: [
                            IconButton(
                              icon: Icon(Icons.share),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: Icon(Icons.star_border),
                              onPressed: () {},
                            ),
                          ],
                          leading: IconButton(
                            icon: Icon(Icons.arrow_back_ios),
                            onPressed: () {},
                          ),
                          backgroundColor: Colors.purple,
                          expandedHeight:
                              MediaQuery.of(context).size.height * 0.3,
                          floating: false,
                          title: Text(
                            _silverCollapsed
                                ? snapshot.currentHikeModel.title ?? ''
                                : '',
                            style: kDefaultFont.copyWith(
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.05),
                          ),
                          centerTitle: true,
                          pinned: true,
                          flexibleSpace: FlexibleSpaceBar(
                            background: Stack(
                              children: [
                                PageView.builder(
                                    itemCount: snapshot.currentHikeModel != null
                                        ? snapshot.currentHikeModel.img.length
                                        : 0,
                                    scrollDirection: Axis.horizontal,
                                    controller: PageController(
                                      initialPage:
                                          snapshot.currentImagePageIndex,
                                    ),
                                    onPageChanged: (pageIndex) {
                                      snapshot.setImageIndex(pageIndex);
                                    },
                                    itemBuilder: (context, i) {
                                      return Image.network(
                                          snapshot.currentHikeModel.img[
                                              snapshot.currentImagePageIndex],
                                          fit: BoxFit.cover);
                                    }),
                                Positioned(
                                  left:
                                      MediaQuery.of(context).size.width * 0.04,
                                  bottom:
                                      MediaQuery.of(context).size.height * 0.01,
                                  child: DotsIndicator(
                                    dotsCount: 4,
                                    position: snapshot.currentImagePageIndex
                                        .toDouble(),
                                    decorator: DotsDecorator(
                                      color: Colors.white70,
                                      spacing: EdgeInsets.symmetric(
                                          horizontal: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.005),
                                      size: Size.square(
                                          MediaQuery.of(context).size.width *
                                              0.015),
                                      activeSize: Size.square(
                                          MediaQuery.of(context).size.width *
                                              0.025),
                                      activeColor: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ));
                    }),
                    Consumer<HikeModelProvider>(
                        builder: (context, snapshot, _) {
                      if (snapshot.currentHikeModel != null) {
                        return SliverList(
                          delegate: SliverChildListDelegate(
                            [
                              HikePage(
                                hikeModel: snapshot.currentHikeModel,
                              )
                            ],
                          ),
                        );
                      }
                      return SliverList(
                          delegate: SliverChildListDelegate(
                        ([
                          SizedBox(
                            width: 0,
                            height: 0,
                          ),
                        ]),
                      ));
                    }),
                  ],
                ),
                Consumer<HikeModelProvider>(builder: (context, snapshot, _) {
                  return Visibility(
                    visible: snapshot.load,
                    child: SpinKitDoubleBounce(
                      color: Colors.purple,
                      size: MediaQuery.of(context).size.width * 0.08,
                    ),
                  );
                }),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: MaterialButton(
                    height: MediaQuery.of(context).size.height * 0.08,
                    color: Colors.purple,
                    onPressed: () {},
                    child: Text('قم بالحجز الآن',
                        style: GoogleFonts.cairo().copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize:
                                MediaQuery.of(context).size.width * 0.04)),
                  ),
                )
              ],
            )));
  }
}
