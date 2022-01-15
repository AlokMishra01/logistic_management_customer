import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/values.dart';

class TypeBar extends StatelessWidget {
  final bool selected;
  final String title;
  final IconData? icon;
  final VoidCallback onTab;

  const TypeBar({
    Key? key,
    this.selected = false,
    this.icon,
    required this.onTab,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Material(
          borderRadius: BorderRadius.circular(32),
          color: selected ? TEXT_WHITE : FIELD_BACKGROUND,
          child: InkWell(
            onTap: onTab,
            borderRadius: BorderRadius.circular(32),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(BASE_PADDING),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (icon != null)
                      Icon(
                        icon,
                        color: selected ? TEXT_BLUE : TEXT_SECONDARY_LIGHT,
                      ),
                    if (icon != null) const SizedBox(width: 4.0),
                    Text(
                      title,
                      style: TextStyle(
                        color: selected ? TEXT_BLUE : TEXT_SECONDARY_LIGHT,
                        fontSize: TITLE_TEXT,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
