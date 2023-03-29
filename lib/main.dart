import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

void main() {
  return runApp(const BlackoutDatesUpdation());
}

class BlackoutDatesUpdation extends StatefulWidget {
  const BlackoutDatesUpdation({super.key});

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
              monthCellStyle: const DateRangePickerMonthCellStyle(
                blackoutDateTextStyle: TextStyle(
                    color: Colors.red, decoration: TextDecoration.lineThrough),
              ),
              onViewChanged: viewChanged,
            )),
      ),
    );
  }

  void viewChanged(DateRangePickerViewChangedArgs args) {
    List<DateTime> blackoutDateCollection = <DateTime>[];
    final DateTime visibleStartDate = args.visibleDateRange.startDate!;
    blackoutDateCollection.add(visibleStartDate);
    blackoutDateCollection.add(visibleStartDate.add(const Duration(days: 1)));
    blackoutDateCollection.add(visibleStartDate.add(const Duration(days: 2)));
    blackoutDateCollection.add(visibleStartDate.add(const Duration(days: 3)));
    blackoutDateCollection.add(visibleStartDate.add(const Duration(days: 4)));
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        _blackoutDates = blackoutDateCollection;
      });
    });
  }
}