import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:inovolatask/constants.dart';
import 'package:inovolatask/reusable_widgets/course_reusable_widgets/base_hike_container.dart';

import 'icon_text_reusable_widget.dart';

class HikeTitle extends StatelessWidget {
  final String interest;
  final String title;
  final date;
  final String location;

  HikeTitle(
      {@required this.interest,
      @required this.title,
      @required this.date,
      @required this.location});

  @override
  Widget build(BuildContext context) {
    final _bodyTextStyle = kBodyTextStyle.copyWith(
        fontSize: MediaQuery.of(context).size.width * 0.03);
    return BaseHikeContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('# ' + interest, style: _bodyTextStyle),
          Text(title,
              style: kTitleTextStyle.copyWith(
                  fontSize: MediaQuery.of(context).size.width * 0.05)),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          IconTextContainer(
              icon: Icons.date_range, text: Text(date, style: _bodyTextStyle)),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          IconTextContainer(
              icon: FontAwesomeIcons.mapMarkerAlt,
              text: Text(location, style: _bodyTextStyle)),
        ],
      ),
    );
  }
}
