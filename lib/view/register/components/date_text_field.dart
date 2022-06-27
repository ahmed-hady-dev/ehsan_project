import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../constants/app_colors.dart';
//
// class DateTextField extends StatelessWidget {
//   const DateTextField({
//     Key? key,
//     required this.hintText,
//     required this.controller,
//     required this.onFieldSubmitted,
//   }) : super(key: key);
//   final String hintText;
//   final TextEditingController? controller;
//   final Function(String)? onFieldSubmitted;
//
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: controller,
//       keyboardType: TextInputType.phone,
//       validator: (value) {
//         if (value!.isEmpty) {
//           return "يجب ألا يكون تاريخ الميلاد فارغ";
//         } else {
//           return null;
//         }
//       },
//       onFieldSubmitted: onFieldSubmitted,
//       decoration: InputDecoration(
//           hintText: hintText,
//           prefixIcon: const Icon(
//             Icons.home_outlined,
//             color: AppColors.blue6,
//           )),
//     );
//   }
// }

class TestPickerWidget extends StatefulWidget {
  @override
  _TestPickerWidgetState createState() => _TestPickerWidgetState();
}

class _TestPickerWidgetState extends State<TestPickerWidget> {
  DateTime? _selectedDate;
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: AlwaysDisabledFocusNode(),
      controller: _textEditingController,
      onTap: () {
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async {
    DateTime? newSelectedDate = await showDatePicker(
        context: context,
        initialDate: _selectedDate != null ? _selectedDate! : DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2040),
        builder: (context, child) {
          return Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: ColorScheme.dark(
                primary: Colors.deepPurple,
                onPrimary: Colors.white,
                surface: Colors.blueGrey,
                onSurface: Colors.yellow,
              ),
              dialogBackgroundColor: Colors.blue[500],
            ),
            child: child!,
          );
        });

    if (newSelectedDate != null) {
      _selectedDate = newSelectedDate;
      _textEditingController
        ..text = DateFormat.yMMMd().format(_selectedDate!)
        ..selection = TextSelection.fromPosition(
            TextPosition(offset: _textEditingController.text.length, affinity: TextAffinity.upstream));
    }
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
