import 'package:flutter/material.dart';
import 'package:fonibo_task/views/utils/constants.dart';

class CustomList extends StatefulWidget {
  final Color color;
  final String title;
  final String createdAt;
  bool isSelected;
  final Function onPressed;
  CustomList(
      {Key key,
      this.color = Constants.colorBlue,
      this.title = 'title',
      this.createdAt = 'createdAt',
      this.isSelected = false,
      this.onPressed})
      : super(key: key);

  @override
  _CustomListState createState() => _CustomListState();
}

class _CustomListState extends State<CustomList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 4.0, bottom: 4.0, left: 16.0, right: 14.0),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 6.0),
            height: 66.0,
            width: 9.0,
            decoration: BoxDecoration(
              color: widget.color.withOpacity(0.35),
              borderRadius: BorderRadius.circular(6.0),
            ),
          ),
          Expanded(
            child: Container(
              height: 66.0,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  color: Constants.colorGrey,
                  borderRadius: BorderRadius.circular(12.0)),
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          widget.createdAt,
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() => widget.isSelected = !widget.isSelected);
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 18.0),
                        height: 18.0,
                        width: 18.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 2.0,
                              color: widget.isSelected
                                  ? Colors.green
                                  : Constants.colorBlue,
                            ),
                            shape: BoxShape.circle),
                        child: widget.isSelected
                            ? Container(
                                height: 8,
                                width: 8,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    shape: BoxShape.circle),
                              )
                            : null,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
