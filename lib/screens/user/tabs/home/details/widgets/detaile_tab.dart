import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetaileButtomTab extends StatelessWidget {
  final String? productDetaile;

  const DetaileButtomTab({Key? key, this.productDetaile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
          child: SizedBox(
            height: 180.h,
            child: SingleChildScrollView(
              child: Text(
                productDetaile.toString(),
                overflow: TextOverflow.fade,
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 15.0),
          color: const Color.fromRGBO(250, 250, 250, 1.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Icon(
                    Icons.history,
                    color: Colors.blue[900],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    child: Text('12am - 3pm'),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Icon(
                    Icons.gps_fixed,
                    color: Colors.green[300],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    child: Text('3.54 km'),
                  ),
                ],
              ),
              Column(
                children: const <Widget>[
                  Icon(
                    Icons.map,
                    color: Colors.redAccent,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    child: Text('Map view'),
                  )
                ],
              ),
              Column(
                children: const <Widget>[
                  Icon(
                    Icons.directions_walk,
                    color: Colors.deepOrange,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    child: Text('Delivery'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
