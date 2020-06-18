import 'package:flutter/material.dart';

class BaseHikeContainer extends StatelessWidget {
  final Widget child;
  BaseHikeContainer({this.child});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        child,
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        Divider(
          color: Colors.grey[300],
          height: MediaQuery.of(context).size.height * 0.01,
          thickness: 1,
        )
      ],
    );
  }
}

class HikeBody extends StatelessWidget {
  final Widget topWidget;
  final Widget bottomWidget;

  HikeBody({@required this.topWidget, @required this.bottomWidget});

  @override
  Widget build(BuildContext context) {
    return BaseHikeContainer(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        topWidget,
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        bottomWidget
      ],
    ));
  }
}
