import 'package:MZQUIZARDRY/api_calls.dart';
import 'package:MZQUIZARDRY/constants.dart';
import 'package:MZQUIZARDRY/pages/picture.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class start extends StatefulWidget {
  const start({super.key});

  @override
  State<start> createState() => _startState();
}

class _startState extends State<start> {
  @override
  void initState() {
    get_r2_question().whenComplete(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: round2.length,
      itemBuilder: (context, i) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListView.builder(
              shrinkWrap: true,
              itemCount: round2[i]['PICTURE_COUNT'],
              itemBuilder: (context, index) {
                return CachedNetworkImage(
                  placeholder: (context, url) => CircularProgressIndicator(),
                  imageUrl: round2[i]["PICTURE_${index + 1}"],
                );
              },
            ),
          ],
        );
      },
    );
  }
}
