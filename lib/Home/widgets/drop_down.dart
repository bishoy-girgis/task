import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropDown extends StatelessWidget {
  String? dropdownValue;
  void Function(String?)? onChanged;
  List<String>? nationalityList;

  DropDown(
      {super.key, this.dropdownValue, this.onChanged, this.nationalityList});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration:  InputDecoration(
       contentPadding: const EdgeInsets.symmetric(vertical: 15,horizontal: 20),
        labelText: 'Select Nationality',
        fillColor: Colors.white,
        filled: true,
        labelStyle: Theme.of(context).textTheme.bodySmall,
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
      ),
      style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.black),
      value: dropdownValue,
      onChanged: onChanged,
      items: nationalityList?.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      icon: Icon(
        Icons.arrow_drop_down,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
