import 'package:flutter/material.dart';
import 'package:fooddelivery/utils/colors.dart';
import 'package:fooddelivery/widgets/small_text.dart';
import 'package:fooddelivery/utils/dimensions.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  const ExpandableTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;
  bool hiddenText = true;
  double textHeight = Dimensions.screenHeight/5.63;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? SmallText(text: firstHalf)
          : Column(
        children: [
          SmallText(
              height: 1.8,
              size: Dimensions.font26/2,
              color: AppColors.paraColor,
              text: hiddenText
                  ? (firstHalf + '...')
                  : (firstHalf + secondHalf)),

          InkWell(
            onTap: () {
              setState(() {
                hiddenText = !hiddenText;
              });
            },
            child: Row(
              children: [
                SmallText(
                    text: hiddenText ? 'Show more' : ' Scroll back',
                    color: AppColors.mainColor),
                Icon(
                    hiddenText
                        ? Icons.arrow_drop_down
                        : Icons.arrow_drop_up,
                    color: AppColors.mainColor),
              ],
            ),
          )
        ],
      ),
    );
  }
}