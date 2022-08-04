import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartix/presentation/blocs/device/device_bloc.dart';
import 'package:smartix/presentation/pages/dashboard/dashboard_screen.dart';
import 'package:smartix/presentation/widgets/common/add_new_device_button.dart';
import 'package:smartix/presentation/widgets/dashboard/dashboard_status_row.dart';

class DevicesWidget extends StatefulWidget {
  const DevicesWidget({Key? key}) : super(key: key);

  @override
  State<DevicesWidget> createState() => _DevicesWidgetState();
}

class _DevicesWidgetState extends State<DevicesWidget> {
  final bloc = dashboardDevicesBloc;
  @override
  void initState() {
    super.initState();
    bloc.getDevices();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeviceBloc, DeviceState>(
      bloc: bloc,
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          children: [
            Column(
              children: List.generate(
                state.deviceList?.length ?? 0,
                (index) {
                  final device = state.deviceList![index];
                  return DashboardStatusRow(
                    device: device,
                    bloc: bloc,
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: AddNewDeviceButton(
                bloc: bloc,
              ),
            ),
          ],
        );
      },
    );
  }
}
