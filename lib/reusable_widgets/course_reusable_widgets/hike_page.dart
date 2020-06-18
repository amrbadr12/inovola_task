import 'package:flutter/material.dart';
import 'package:inovolatask/models/course_model.dart';
import 'package:inovolatask/utils/app_utils.dart';

import '../../constants.dart';
import 'base_hike_container.dart';
import 'hike_title.dart';

class HikePage extends StatelessWidget {
  final HikeModel hikeModel;
  HikePage({this.hikeModel});
  @override
  Widget build(BuildContext context) {
    TextStyle _bodyTextStyle = kBodyTextStyle.copyWith(
      fontSize: MediaQuery.of(context).size.width * 0.03,
    );
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HikeTitle(
            interest: hikeModel.interest,
            title: hikeModel.title,
            date: AppUtil.formatDateInArabic(hikeModel.date),
            location: hikeModel.address,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          HikeBody(
            topWidget: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(hikeModel.trainerImage),
                  backgroundColor: Colors.purple,
                  radius: MediaQuery.of(context).size.width * 0.03,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.01,
                ),
                Text(
                  hikeModel.trainerName,
                  style: _bodyTextStyle.copyWith(
                      fontWeight: FontWeight.w900,
                      fontSize: MediaQuery.of(context).size.width * 0.035),
                )
              ],
            ),
            bottomWidget: Text(
              hikeModel.trainerInfo,
              style: _bodyTextStyle,
            ),
          ),
          HikeBody(
            topWidget: Text(
              'عن الدورة',
              style: _bodyTextStyle.copyWith(
                  fontWeight: FontWeight.w900,
                  fontSize: MediaQuery.of(context).size.width * 0.035),
            ),
            bottomWidget: Text(
              hikeModel.occasionDetail,
              style: _bodyTextStyle,
            ),
          ),
          HikeBody(
              topWidget: Text(
                'تكلفة الدورة',
                style: _bodyTextStyle.copyWith(
                    fontWeight: FontWeight.w900,
                    fontSize: MediaQuery.of(context).size.width * 0.035),
              ),
              bottomWidget: Container(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.all(0.0),
                  itemCount: hikeModel.reserveTypes.length ?? 0,
                  itemBuilder: (context, i) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              hikeModel.reserveTypes[i]['name']
                                  .toString()
                                  .replaceAll('/', ''),
                              style: _bodyTextStyle,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.01,
                            ),
                            Text(
                              hikeModel.reserveTypes[i]['price'].toString() +
                                  ' SAR',
                              style: _bodyTextStyle,
                            ),
                          ],
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01)
                      ],
                    );
                  },
                ),
              )),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          )
        ],
      ),
    );
  }
}
