import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pciu_hubspot/controller/home_controller/empty_room_controller.dart';
import 'package:pciu_hubspot/core/constants/colors.dart';
import 'package:pciu_hubspot/core/models/empty_room_model.dart';
import 'package:pciu_hubspot/core/utils/progress_indicator.dart';
import 'package:pciu_hubspot/core/utils/snackbar_message.dart';

class EmptyRoomScreen extends StatefulWidget {
  const EmptyRoomScreen({super.key});

  @override
  State<EmptyRoomScreen> createState() => _EmptyRoomScreenState();
}

class _EmptyRoomScreenState extends State<EmptyRoomScreen> {
  List<EmptyRoomModel> scheduleData = [];

  final List<String> timeSlots = [
    "9:00 AM - 10:30 AM",
    "10:30 AM - 12:00 PM",
    "12:00 PM - 1:25 PM",
    "2:00 PM - 3:25 PM",
    "3:30 PM - 5:00 PM"
  ];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    final controller = EmptyRoomController.instance;
    final result = await controller.getEmptyRoom();

    if (result) {
      setState(() {
        scheduleData = controller.emptyRoomList ?? [];
      });
    } else {
      SnackBarMessage.errorMessage(controller.errorMessage!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Empty Room Schedule',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        centerTitle: true,
        forceMaterialTransparency: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.5),
          child: Container(
            color: Colors.grey.withOpacity(0.2),
            height: 1.5,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: GetBuilder<EmptyRoomController>(
          builder: (controller) {
            return controller.inProgress
                ? const ProgressIndicatorWidget()
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 16),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: scheduleData.length,
                          itemBuilder: (context, index) {
                            final dayData = scheduleData[index];
                            return Card(
                              color: shadeColor,
                              elevation: 1,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      dayData.day,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Table(
                                      border: TableBorder.all(
                                        color: Colors.grey.shade400,
                                        width: 1,
                                        borderRadius: BorderRadius.circular(8)
                                      ),
                                      columnWidths: const {
                                        0: FixedColumnWidth(120),
                                        1: FlexColumnWidth(2),
                                      },
                                      children: timeSlots
                                          .asMap()
                                          .entries
                                          .map((entry) {
                                        return TableRow(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                entry.value,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.blue.shade700,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: _buildRoomList(
                                                entry.key + 1,
                                                dayData,
                                              ),
                                            ),
                                          ],
                                        );
                                      }).toList(),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(height: 16);
                          },
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  );
          },
        ),
      ),
    );
  }

  Widget _buildRoomList(int index, EmptyRoomModel dayData) {
    final roomData = _getTimeSlotData(index, dayData);
    if (roomData.isEmpty) {
      return const Text('No rooms available');
    }
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: roomData
          .map(
            (slot) => Chip(
              label: Text(slot),
              backgroundColor: Colors.blue.shade50,
            ),
          )
          .toList(),
    );
  }

  List<String> _getTimeSlotData(int index, EmptyRoomModel dayData) {
    switch (index) {
      case 1:
        return dayData.ctime1;
      case 2:
        return dayData.ctime2;
      case 3:
        return dayData.ctime3;
      case 4:
        return dayData.ctime4;
      case 5:
        return dayData.ctime5;
      default:
        return [];
    }
  }
}
