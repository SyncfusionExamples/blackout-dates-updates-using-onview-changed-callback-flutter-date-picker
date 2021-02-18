import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

void main() {
  return runApp(BlackoutDates_Updation());
}

class BlackoutDates_Updation extends StatefulWidget {
  @override
  BlackoutDates createState() => BlackoutDates();
}

class BlackoutDates extends State<BlackoutDates_Updation> {
  List<DateTime> _blackoutDates;

  @override
  void initState() {
    _blackoutDates = <DateTime>[];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Card(
            margin: const EdgeInsets.fromLTRB(50, 150, 50, 150),
            child: SfDateRangePicker(
              selectionMode: DateRangePickerSelectionMode.single,
              monthViewSettings: DateRangePickerMonthViewSettings(
                  blackoutDates: _blackoutDates),
              monthCellStyle: DateRangePickerMonthCellStyle(blackoutDateTextStyle:
                TextStyle(
                    color: Colors.red,
                    decoration: TextDecoration.lineThrough),
              ),
              onViewChanged: viewChanged,
            )),
      ),
    );
  }

  void viewChanged(DateRangePickerViewChangedArgs args) {
    List<DateTime> _blackoutDateCollection = <DateTime>[];
    _blackoutDateCollection.add(args.visibleDateRange.startDate);
    _blackoutDateCollection
        .add(args.visibleDateRange.startDate.add(Duration(days: 1)));
    _blackoutDateCollection
        .add(args.visibleDateRange.startDate.add(Duration(days: 2)));
    _blackoutDateCollection
        .add(args.visibleDateRange.startDate.add(Duration(days: 3)));
    _blackoutDateCollection
        .add(args.visibleDateRange.startDate.add(Duration(days: 4)));
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        _blackoutDates = _blackoutDateCollection;
      });
    });
  }
}
