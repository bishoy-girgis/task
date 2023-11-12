
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DateRange extends StatelessWidget {
  String? text;
  final void Function()? onTap;
   DateRange({super.key ,this.text,this.onTap});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQuery = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      width: mediaQuery.width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: theme.primaryColor)),
      child: Center(
        child: ElevatedButton(
          style: ButtonStyle(
            padding: const MaterialStatePropertyAll(
                EdgeInsets.symmetric(horizontal: 70,vertical: 11)),
            backgroundColor:
            const MaterialStatePropertyAll(
                Colors.white),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(
                      color: theme.primaryColor)),
            ),
          ),
          onPressed: onTap,
          child: Text(
            text!,
            style: theme.textTheme.bodySmall,
          ),
        ),
      ),
    );
  }
}
