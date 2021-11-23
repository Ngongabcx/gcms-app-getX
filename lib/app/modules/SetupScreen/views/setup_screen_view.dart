import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:gcms/app/modules/ActiveGameScreen/views/select_holes_card.dart';
import 'package:gcms/app/modules/commonWidgets/customButton.dart';
import 'package:gcms/app/modules/commonWidgets/custom_multi_select_drop_down.dart';
import 'package:gcms/app/modules/commonWidgets/custom_single_select_drop_down.dart';
import 'package:gcms/app/modules/commonWidgets/loader/loading_provider.dart';
import 'package:gcms/constants/constant.dart';

import 'package:get/get.dart';
import 'package:provider/src/provider.dart';

import '../controllers/setup_screen_controller.dart';

class SetupScreenView extends GetView<SetupScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        automaticallyImplyLeading: true,
        title: Text(
          ' Match Setup',
          style: Theme.of(context).textTheme.headline3,
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              TextFormField(
                controller: controller.matchName,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(
                        color: Color(0xFF22C17B),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(
                        color: Color(0xFF9C9D9E),
                      ),
                    ),
                    labelText: 'Match Name',
                    labelStyle: Theme.of(context).textTheme.headline3),
              ),
              const SizedBox(height: 20),
              Text(
                'Select Golf Course',
                style: Theme.of(context).textTheme.headline3,
              ),
              const SizedBox(height: 20),
              Obx(() {
                Future.delayed(Duration.zero, () async {
                  context
                      .read<LoadingProvider>()
                      .setLoad(controller.isProcessing.value);
                });
                return CustomDropDown(
                  "Golf Course",
                  "Select Golf Course",
                  true,
                  List.generate(controller.lstCourses.length,
                      (index) => controller.lstCourses[index].courseName),
                );
              }),
              const SizedBox(height: 20),
              Text(
                'Player Setup',
                style: Theme.of(context).textTheme.headline3,
              ),
              const SizedBox(height: 16),
              Obx(() {
                Future.delayed(Duration.zero, () async {
                  context
                      .read<LoadingProvider>()
                      .setLoad(controller.isProcessing.value);
                });
                return CustomDropDownMultiSelect(
                  "Invite Players",
                  "Player in menu mode",
                  true,
                  true,
                  List.generate(controller.lstPlayers.length,
                      (index) => controller.lstPlayers[index].firstName),
                );
              }),
              const SizedBox(height: 20),
              Text('Select Holes',
                  style: Theme.of(context).textTheme.headline3),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(() {
                    return SelectHolesCard(
                      onPress: () {
                        controller.selectedHole.value = 9;
                        print(controller.selectedHole.value);
                      },
                      color: controller.selectedHole.value == 9
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Text(
                          '9 Holes',
                          style: Theme.of(context).textTheme.bodyText1,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }),
                  Obx(() {
                    return SelectHolesCard(
                      onPress: () {
                        controller.selectedHole.value = 18;
                        print(controller.selectedHole.value);
                      },
                      color: controller.selectedHole.value == 18
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Text(
                          '18 Holes',
                          style: Theme.of(context).textTheme.bodyText1,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DropdownButton<int>(
                    hint: Text(
                      'Start from',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    items: controller.hole9options.map((int value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Text(value.toString()),
                      );
                    }).toList(),
                    onChanged: (int newSelectedHole) {
                      controller.selectedHole.value = newSelectedHole;
                    },
                  ),
                  DropdownButton<int>(
                    hint: Text(
                      'End At',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    items: controller.hole18options.map((int value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Text(value.toString()),
                      );
                    }).toList(),
                    onChanged: (_) {},
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      onPressed: () {
                        DatePicker.showDatePicker(context,
                            theme: const DatePickerTheme(
                              containerHeight: 210.0,
                            ),
                            showTitleActions: true,
                            minTime: DateTime(2000, 1, 1),
                            maxTime: DateTime(2022, 12, 31), onConfirm: (date) {
                          print('confirm $date');
                          controller.matchDate.value =
                              '${date.year}-${date.month}-${date.day}';
                        }, currentTime: DateTime.now(), locale: LocaleType.en);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      const Icon(
                                        Icons.date_range,
                                        size: 18.0,
                                        color: Color(0xFF9C9D9E),
                                      ),
                                      Obx(() => Text(
                                            " ${controller.matchDate.value}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText2,
                                          )),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Text(
                              "  Change",
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                          ],
                        ),
                      ),
                      color: Colors.white,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      elevation: 4.0,
                      onPressed: () {
                        DatePicker.showTimePicker(context,
                            theme: const DatePickerTheme(
                              containerHeight: 210.0,
                            ),
                            showTitleActions: true, onConfirm: (time) {
                          controller.matchTime.value =
                              '${time.hour}:${time.minute}:${time.second}';
                        }, currentTime: DateTime.now(), locale: LocaleType.en);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      const Icon(
                                        Icons.access_time,
                                        size: 18.0,
                                        color: Color(0xFF9C9D9E),
                                      ),
                                      Obx(() {
                                        return Text(
                                            "${controller.matchTime.value}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText2);
                                      }),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Text(
                              "  Change",
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                          ],
                        ),
                      ),
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 50),
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Obx(() {
                    //Dismissing the keyboard
                    FocusScope.of(context).requestFocus(new FocusNode());
                    return CustomButton(
                      text: controller.isProcessing.value == true
                          ? 'Processing'
                          : 'Confirm',
                      onPressed: () {
                        controller.createCompetition({
                          "CompName": controller.matchName.text.toString(),
                          "GametypeId": 1,
                          "CompDate": controller.matchDate.value.toString(),
                          "CourseId": controller.selectedCourseId.value,
                          "CompetitionPlayer": [
                            {"PlayerId": 8},
                            {"PlayerId": 15},
                            {"PlayerId": 18}
                          ]
                        });
                      },
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
