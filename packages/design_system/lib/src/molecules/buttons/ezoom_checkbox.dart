import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class EzoomCheckboxText extends StatefulWidget {
  final String title;
  final bool initialValue;
  final Function(bool) onTap;

  const EzoomCheckboxText({
    super.key,
    required this.title,
    this.initialValue = false,
    required this.onTap,
  });

  @override
  State<EzoomCheckboxText> createState() => _EzoomCheckboxTextState();
}

class _EzoomCheckboxTextState extends State<EzoomCheckboxText> {
  late bool initialValue;

  @override
  void initState() {
    initialValue = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          initialValue = !initialValue;
        });
        widget.onTap(initialValue);
      },
      child: Row(
        children: [
          AbsorbPointer(
            child: SizedBox(
              height: 32,
              width: 32,
              child: Checkbox(
                activeColor: context.colors.background,
                value: initialValue,
                onChanged: (value) {},
              ),
            ),
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            widget.title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.normal,
              color: context.colors.background,
            ),
          ),
        ],
      ),
    );
  }
}
