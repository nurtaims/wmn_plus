import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wmn_plus/util/config.dart';

class ConsultationData extends StatefulWidget {
  @override
  _ConsultationDataState createState() => _ConsultationDataState();
}

class _ConsultationDataState extends State<ConsultationData> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          titleContent(context),
          SizedBox(height: ScreenUtil().setHeight(20)),
          categoriesContent(context),
          SizedBox(height: ScreenUtil().setHeight(40)),
          chatsContent(context),
        ],
      ),
    );
  }

  Widget chatsContent(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(30)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text('Консультации', style: Theme.of(context).textTheme.display1),
              Text('Посмотреть все',
                  style: Theme.of(context).textTheme.display2),
            ],
          ),
          SizedBox(height: ScreenUtil().setHeight(40)),
          chatList(context),
        ],
      ),
    );
  }

  Widget chatList(BuildContext context) {
    TextStyle textStyle = TextStyle(
        color: Colors.black,
        fontSize: ScreenUtil().setSp(50),
        fontWeight: FontWeight.w500);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setSp(30))),
      ),
      padding: EdgeInsets.symmetric(
          vertical: ScreenUtil().setHeight(30),
          horizontal: ScreenUtil().setWidth(30)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // --- DOCTOR IMAGE
          Container(
            width: ScreenUtil().setWidth(200),
            height: ScreenUtil().setHeight(160),
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.circular(ScreenUtil().setSp(40))),
                color: Colors.red,
                image: DecorationImage(
                    image: NetworkImage(
                        'https://static.makeuseof.com/wp-content/uploads/2015/11/perfect-profile-picture-all-about-face.jpg'),
                    fit: BoxFit.cover)),
          ),
          // --- CHAT INFORMATION
          SizedBox(width: ScreenUtil().setWidth(35)),
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Dr. Gary Hawkins', style: textStyle),
                      Text('10.05.2019',
                          style: Theme.of(context).textTheme.display2),
                    ],
                  ),
                  SizedBox(height: ScreenUtil().setHeight(10)),
                  Text(
                    'You: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.display2,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget categoriesContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setWidth(30),
              vertical: ScreenUtil().setHeight(30)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text('Категории', style: Theme.of(context).textTheme.display1),
              Text('Посмотреть все',
                  style: Theme.of(context).textTheme.display2),
            ],
          ),
        ),
        Container(
          height: ScreenUtil().setHeight(190),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: DOCTOR_CATEGORIES.map((object) {
              return categoriesList(context, object);
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget categoriesList(BuildContext context, Map object) {
    TextStyle textStyle = TextStyle(
        fontSize: ScreenUtil().setSp(42),
        fontWeight: FontWeight.w300,
        color: Colors.white);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(30)),
      padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(40)),
      decoration: BoxDecoration(
        color: object['color'],
        borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setSp(25))),
      ),
      child: Center(
        child: Text(object['value'], style: textStyle),
      ),
    );
  }

  Widget titleContent(BuildContext context) {
    TextStyle textStyle = TextStyle(
        fontSize: ScreenUtil().setSp(55),
        fontWeight: FontWeight.w200,
        letterSpacing: 0.2);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(ScreenUtil().setSp(100)),
          bottomRight: Radius.circular(ScreenUtil().setSp(100)),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(50)),
      height: ScreenUtil().setHeight(450),
      width: ScreenUtil().width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: ScreenUtil().setHeight(120)),
          titleIcons(context),
          SizedBox(height: ScreenUtil().setHeight(40)),
          Text('Найди своего', style: textStyle),
          Text(
            'Консультанта',
            style: textStyle.copyWith(
                fontWeight: FontWeight.w600, fontSize: ScreenUtil().setSp(75)),
          ),
        ],
      ),
    );
  }

  Widget titleIcons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Icon(Icons.short_text, size: ScreenUtil().setSp(80)),
      ],
    );
  }
}
