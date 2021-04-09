import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

void main() {
  return runApp(BlackoutDatesUpdation());
}

class BlackoutDatesUpdation extends StatefulWidget {
  @override
  BlackoutDates createState() => BlackoutDates();
}

class BlackoutDates extends State<BlackoutDatesUpdation> {
  List<DateTime> _blackoutDates = <DateTime>[];

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
              monthCellStyle: DateRangePickerMonthCellStyle(
                blackoutDateTextStyle: TextStyle(
                    color: Colors.red, decoration: TextDecoration.lineThrough),
              ),
              onViewChanged: viewChanged,
            )),
      ),
    );
  }

  void viewChanged(DateRangePickerViewChangedArgs args) {
    List<DateTime> _blackoutDateCollection = <DateTime>[];
    final DateTime visibleStartDate = args.visibleDateRange.startDate!;
    _blackoutDateCollection.add(visibleStartDate);
    _blackoutDateCollection.add(visibleStartDate.add(Duration(days: 1)));
    _blackoutDateCollection.add(visibleStartDate.add(Duration(days: 2)));
    _blackoutDateCollection.add(visibleStartDate.add(Duration(days: 3)));
    _blackoutDateCollection.add(visibleStartDate.add(Duration(days: 4)));
    SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
      setState(() {
        _blackoutDates = _blackoutDateCollection;
      });
    });
  }
}
