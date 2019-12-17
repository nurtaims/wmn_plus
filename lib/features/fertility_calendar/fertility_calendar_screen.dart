import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wmn_plus/features/fertility_calendar/calendar/calendar_carousel.dart';
import 'package:wmn_plus/features/fertility_calendar/calendar/classes/event.dart';
import 'package:wmn_plus/features/fertility_calendar/index.dart';

class FertilityCalendarScreen extends StatefulWidget {
  FertilityCalendarScreen({
    Key key,
    @required FertilityCalendarBloc fertilityCalendarBloc,
  })  : _fertilityCalendarBloc = fertilityCalendarBloc,
        super(key: key);

  final FertilityCalendarBloc _fertilityCalendarBloc;
  DateTime _varCurrentTime = DateTime.now();
  DateTime _currentTime = DateTime.now();

  @override
  FertilityCalendarScreenState createState() {
    return FertilityCalendarScreenState(_fertilityCalendarBloc);
  }
}

class FertilityCalendarScreenState extends State<FertilityCalendarScreen> {
  final FertilityCalendarBloc _fertilityCalendarBloc;
  FertilityCalendarScreenState(this._fertilityCalendarBloc);
  List<DateTime> babyDate = [];
  @override
  void initState() {
    super.initState();
    this._load();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance =
        ScreenUtil(width: 828, height: 1792, allowFontScaling: true)
          ..init(context);
    return BlocBuilder<FertilityCalendarBloc, FertilityCalendarState>(
        bloc: widget._fertilityCalendarBloc,
        builder: (
          BuildContext context,
          FertilityCalendarState currentState,
        ) {
          if (currentState is UnFertilityCalendarState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (currentState is InFertilityCalendarState) {
            return Column(
              children: <Widget>[
                buildRedHeader(context),
                buildDailyCalendar(currentState),
                buildInfoBlock()
              ],
            );
          }
          if (currentState is ErrorFertilityCalendarState) {
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(currentState.errorMessage ?? 'Error'),
                Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: RaisedButton(
                    color: Colors.blue,
                    child: Text('reload'),
                    onPressed: () => this._load(),
                  ),
                ),
              ],
            ));
          }
        });
  }

  Widget buildDailyCalendar(InFertilityCalendarState state) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 0.0),
      child: CalendarFertilityCarousel<Event>(
        onDayPressed: (DateTime date, List<Event> events) {
          this.setState(() => widget._varCurrentTime = date);
        },
        prevMonthDayBorderColor: Colors.black,
        weekendTextStyle: TextStyle(
          color: Colors.black,
        ),
        locale: state.language,
        thisMonthDayBorderColor: Colors.grey,
        showWeekDays: true,
        customDayBuilder: (
          bool isSelectable,
          int index,
          bool isSelectedDay,
          bool isToday,
          bool isPrevMonthDay,
          TextStyle textStyle,
          bool isNextMonthDay,
          bool isThisMonthDay,
          DateTime day,
        ) {
          // print(widget._currentTime.toLocal());
          if (state.result.babyDays.contains(day)) {
            return Container(
              width: 50,
              height: 50,
              child: Center(
                  child: Text(
                day.day.toString(),
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(30), color: Colors.white),
              )),
              decoration: BoxDecoration(
                  color: Colors.blueAccent, shape: BoxShape.circle),
            );
          }

          if (state.result.redDays.contains(day)) {
            return Container(
              width: 50,
              height: 50,
              child: Center(
                  child: Text(
                day.day.toString(),
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(30), color: Colors.white),
              )),
              decoration:
                  BoxDecoration(color: Colors.red, shape: BoxShape.circle),
            );
          }

          if (state.result.pMS.contains(day)) {
            return Container(
              width: 50,
              height: 50,
              child: Center(
                  child: Text(
                day.day.toString(),
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(30), color: Colors.white),
              )),
              decoration:
                  BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
            );
          }
        },
        weekdayTextStyle:
            TextStyle(fontSize: ScreenUtil().setSp(30), color: Colors.black),
        weekFormat: false,
        // markedDatesMap: _markedDateMap,
        height: ScreenUtil.getInstance().setHeight(800),
        // selectedDateTime: _currentDate,
        daysHaveCircularBorder: null,
        selectedDateTime: widget._varCurrentTime,
        /// null for not rendering any border, true for circular border, false for rectangular border
      ),
    );
  }

  Container buildRedHeader(BuildContext context) {
    return Container(
      height: ScreenUtil.getInstance().setHeight(600),
      width: MediaQuery.of(context).size.width,
      color: Colors.red,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Месячные",
              style: TextStyle(
                fontSize: ScreenUtil().setSp(80),
                fontWeight: FontWeight.w200,
                color: Colors.white,
              ),
            ),
            Text(
              "1 день",
              style: TextStyle(
                fontSize: ScreenUtil().setSp(90),
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _load([bool isError = false]) {
    widget._fertilityCalendarBloc.add(UnFertilityCalendarEvent());
    widget._fertilityCalendarBloc.add(LoadFertilityCalendarEvent(isError));
  }

  buildInfoBlock() {
    return Container();
  }
}
