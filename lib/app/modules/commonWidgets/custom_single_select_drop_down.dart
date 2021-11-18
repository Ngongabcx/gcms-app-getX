import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

import 'package:gcms/constants/constant.dart';

class CustomDropDown extends GetView {
  final String label;
  final String hint;
  final bool showSearchField;
  final List<String> itemList;

  CustomDropDown(
    this.label,
    this.hint,
    this.showSearchField,
    this.itemList,
  );
  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>(
      mode: Mode.BOTTOM_SHEET,
      showSearchBox: showSearchField,
      items: itemList,
      label: label,
      hint: hint,
      popupItemDisabled: (String s) => s.startsWith('I'),
      dropdownSearchDecoration: InputDecoration(
        constraints: BoxConstraints(maxHeight: 60.0),
        isDense: true,
        isCollapsed: false,
        labelText: label,
        labelStyle: TextStyle(
          color: Colors.grey
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            //color: Color(0xFFDBE2E7),
            width: 0.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: kPrimaryColor,
          ),
        ),
      ),
      onChanged: print,
      selectedItem: "Chinama Golf Course",
    );
  }
}
