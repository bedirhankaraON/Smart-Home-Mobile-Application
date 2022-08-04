// ignore_for_file: avoid_dynamic_calls

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartix/core/resources/theme/colors.dart';
import 'package:smartix/data/datasources/local/icon_parser.dart';
import 'package:smartix/data/datasources/local/mocked_storage/devices.dart';
import 'package:smartix/presentation/blocs/routines/routines_bloc.dart';
import 'package:smartix/presentation/pages/routines/routines_detail/routines_detail_modal.dart';
import 'package:smartix/presentation/widgets/dashboard/dashboard_status_row_item.dart';

class RoutinesRow extends StatefulWidget {
  const RoutinesRow({Key? key}) : super(key: key);

  @override
  State<RoutinesRow> createState() => _RoutinesRowState();
}

class _RoutinesRowState extends State<RoutinesRow> {
  final bloc = RoutinesBloc();
  @override
  void initState() {
    super.initState();
    bloc.getRoutines();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RoutinesBloc, RoutinesState>(
      bloc: bloc,
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: const [
                  Text(
                    'Routines',
                    style: TextStyle(color: ThemeColors.secondary, fontSize: 24),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Row(
                    children: List.generate(state.routinesList?.length ?? 0, (index) {
                      final device = deviceList.firstWhere((element) {
                        return element['id'] == state.routinesList![index].deviceId;
                      });
                      return GestureDetector(
                        onTap: () {
                          routineDetailModal(context, state.routinesList![index], bloc);
                        },
                        child: RoutinesRowItem(
                          name: state.routinesList![index].shortDescription ?? '',
                          icon: ParsedIcon.icon(device, size: 35, color: ThemeColors.secondary),
                        ),
                      );
                    }),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'createNewRoutine', arguments: RoutinesBloc());
                    },
                    child: const RoutinesRowItem(
                      name: 'Add',
                      icon: Icon(
                        CupertinoIcons.plus,
                        size: 35,
                        color: ThemeColors.secondary,
                      ),
                      iconSize: 25,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
