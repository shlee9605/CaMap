import 'package:flutter/material.dart';

import '../custom_class/custom_location.dart';

class AreaInfoWidget extends StatelessWidget {
  const AreaInfoWidget({Key? key, required this.area}) : super(key: key);
  final AreaType? area;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0.0,
      bottom: 0.0,
      child: Container(
        decoration: BoxDecoration(
            boxShadow: [
              const BoxShadow(
                  color: Colors.grey, blurRadius: 2.0, spreadRadius: 1.0),
              BoxShadow(
                  color: Colors.grey.withOpacity(0.7),
                  blurRadius: 4.0,
                  spreadRadius: 2.0),
              BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  blurRadius: 6.0,
                  spreadRadius: 5.0),
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 10.0,
                  spreadRadius: 12.0),
              BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 12.0,
                  spreadRadius: 14.0),
            ],
            color: Colors.white,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(50.0),
                topRight: Radius.circular(50.0))),
        width: MediaQuery.of(context).size.width,
        height: 50.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("이름:  ${area?.name}"),
          ],
        ),
      ),
    );
  }
}
