import 'package:flutter/cupertino.dart';

class CenterImage extends StatelessWidget {
  const CenterImage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/images/plane.png',
        width: 200,
        height: 200,
      ),
    );
  }
}
