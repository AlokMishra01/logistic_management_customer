import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/values.dart';

class TypeBar extends StatelessWidget {
  final bool selected;
  final String title;
  final VoidCallback onTab;

  TypeBar({
    this.selected = false,
    required this.onTab,
    required this.title,
  });

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
                child: Text(
                  title,
                  style: TextStyle(
                    color: selected ? TEXT_BLUE : TEXT_SECONDARY_LIGHT,
                    fontSize: TITLE_TEXT,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
