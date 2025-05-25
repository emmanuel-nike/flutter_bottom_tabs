import 'package:flutter/material.dart';

class QuestionOption extends StatelessWidget {
  const QuestionOption({
    super.key,
    this.isSelected = false,
    required this.text,
    required this.index,
    this.onPress,
  });
  final String text;
  final int index;
  final bool isSelected;
  final VoidCallback? onPress;

  String indexToLetter() {
    if (index < 0 || index > 25) {
      return '';
    }
    return String.fromCharCode(index + 65); // Convert index to A-Z
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: Theme.of(context).cardTheme.surfaceTintColor,
        border: Border.all(
          color: isSelected
              ? Color(0xFF8B88EF)
              : Theme.of(context).cardTheme.surfaceTintColor ?? Colors.grey,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          //const BoxShadow(color: Color.fromARGB(31, 158, 40, 40)),
          const BoxShadow(
            color: Color(0x4848484D),
            spreadRadius: -1.0,
            blurRadius: 2.0,
          ),
        ],
      ),
      child: InkWell(
        onTap: onPress,
        child: Container(
          padding: EdgeInsets.all(15.0),
          height: 70,
          child: Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 25.0,
                  height: 25.0,
                  decoration: BoxDecoration(
                    color: isSelected ? Color(0xFF8B88EF) : Colors.transparent,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    border: Border.all(
                      width: 2,
                      color: isSelected
                          ? Color(0xFF8B88EF)
                          : Theme.of(context).primaryColorLight,
                      style: BorderStyle.solid,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      indexToLetter(),
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10.0),
                Flexible(
                  child: Text(
                    text,
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
