import 'package:flutter/material.dart';
import 'package:smartix/core/resources/theme/colors.dart';
import 'package:smartix/presentation/blocs/routines/routines_bloc.dart';

class DayWidget extends StatefulWidget {
  const DayWidget({Key? key, required this.day, required this.bloc}) : super(key: key);
  final RoutinesBloc bloc;
  final String day;

  @override
  State<DayWidget> createState() => _DayWidgetState();
}

class _DayWidgetState extends State<DayWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final list = widget.bloc.state.dayList ?? [];
        if (list.contains(widget.day)) {
          list.remove(widget.day);
        } else {
          list.add(widget.day);
        }
        widget.bloc.changeDays(list);
        setState(() {});
      },
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              color:
                  widget.bloc.state.dayList?.contains(widget.day) ?? false ? ThemeColors.secondary : Colors.transparent,
              shape: BoxShape.circle,
              border: Border.all(color: ThemeColors.secondary)),
          child: Center(
            child: Text(
              widget.day,
              style: TextStyle(
                color: widget.bloc.state.dayList?.contains(widget.day) ?? false
                    ? ThemeColors.primary
                    : ThemeColors.secondary,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
