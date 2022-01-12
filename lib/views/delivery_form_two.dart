import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logistic_management_customer/controllers/package_controller.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart' as colors;
import '../constants/values.dart' as values;
import '../models/package_type_model.dart';
import '../widgets/custom_input.dart';

class DeliveryFormTwo extends StatelessWidget {
  final PackageTypeModel? type;
  final void Function(PackageTypeModel?)? onChanged;
  final TextEditingController description;
  final bool fragile;
  final ValueChanged<bool?> onChangedFragile;
  final bool express;
  final ValueChanged<bool?> onChangedExpress;
  final TextEditingController height;
  final TextEditingController length;
  final TextEditingController width;
  final TextEditingController weight;
  final VoidCallback onPre;
  final VoidCallback onNext;

  const DeliveryFormTwo({
    Key? key,
    this.type,
    required this.description,
    this.fragile = false,
    this.express = false,
    required this.height,
    required this.length,
    required this.width,
    required this.weight,
    required this.onPre,
    required this.onNext,
    required this.onChangedFragile,
    required this.onChangedExpress,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final package = context.watch<PackageController>();
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: values.BASE_PADDING,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Package Information',
              style: TextStyle(
                fontSize: values.TITLE_TEXT,
                color: colors.TEXT_BLUE,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: values.BASE_PADDING / 2),
            // Todo: dropdown from packages types
            DropdownButtonFormField<PackageTypeModel>(
              value: type,
              items: package.packageTypes
                  .map(
                    (p) => DropdownMenuItem<PackageTypeModel>(
                      value: p,
                      child: Text(p.name ?? ''),
                    ),
                  )
                  .toList(),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(values.RADIUS),
                  borderSide: BorderSide(width: 0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(values.RADIUS),
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(values.RADIUS),
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                ),
                fillColor: colors.FIELD_BACKGROUND,
                filled: true,
                focusColor: colors.TEXT_SECONDARY,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(values.RADIUS),
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                ),
                hintText: 'Type of Package',
                hintStyle: TextStyle(
                  color: colors.TEXT_SECONDARY,
                  fontWeight: FontWeight.w500,
                  height: 1.5,
                ),
              ),
              style: TextStyle(
                color: colors.TEXT_BLACK,
                fontWeight: FontWeight.w600,
                height: 1.5,
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onChanged: onChanged,
            ),
            const SizedBox(height: values.BASE_PADDING / 2),
            Material(
              color: colors.FIELD_BACKGROUND,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(values.RADIUS),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.only(
                  left: values.BASE_PADDING,
                  top: values.BASE_PADDING / 4,
                  bottom: values.BASE_PADDING / 4,
                  right: values.BASE_PADDING / 2,
                ),
                title: const Text(
                  'Fragile ',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: colors.TEXT_SECONDARY,
                    fontSize: values.TITLE_TEXT,
                  ),
                ),
                trailing: CupertinoSwitch(
                  value: fragile,
                  onChanged: onChangedFragile,
                  trackColor: colors.RED,
                  activeColor: colors.BUTTON_GREEN,
                ),
              ),
            ),
            const SizedBox(height: values.BASE_PADDING / 2),
            Material(
              color: colors.FIELD_BACKGROUND,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(values.RADIUS),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.only(
                  left: values.BASE_PADDING,
                  top: values.BASE_PADDING / 4,
                  bottom: values.BASE_PADDING / 4,
                  right: values.BASE_PADDING / 2,
                ),
                title: const Text(
                  'Express ',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: colors.TEXT_SECONDARY,
                    fontSize: values.TITLE_TEXT,
                  ),
                ),
                trailing: CupertinoSwitch(
                  value: express,
                  onChanged: onChangedExpress,
                  trackColor: colors.RED,
                  activeColor: colors.BUTTON_GREEN,
                ),
              ),
            ),
            const SizedBox(height: values.BASE_PADDING),
            const Text(
              'Size of package',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: values.TITLE_TEXT,
                color: colors.TEXT_BLUE,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: values.BASE_PADDING / 2),
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: CustomInput(
                    type: TextInputType.number,
                    controller: height,
                    hint: 'Height',
                  ),
                ),
                const Text(
                  ' X ',
                  style: TextStyle(
                    fontSize: values.TITLE_TEXT,
                    color: colors.TEXT_BLACK,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: CustomInput(
                    type: TextInputType.number,
                    controller: length,
                    hint: 'Length',
                  ),
                ),
                const Text(
                  ' X ',
                  style: TextStyle(
                    fontSize: values.TITLE_TEXT,
                    color: colors.TEXT_BLACK,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: CustomInput(
                    type: TextInputType.number,
                    controller: width,
                    hint: 'Width',
                  ),
                ),
              ],
            ),
            const SizedBox(height: values.BASE_PADDING / 2),
            CustomInput(
              type: TextInputType.number,
              controller: weight,
              hint: 'Weight',
            ),
            const SizedBox(height: values.BASE_PADDING / 2),
            Row(
              children: [
                TextButton(
                  onPressed: onPre,
                  child: Row(
                    children: const [
                      Icon(
                        CupertinoIcons.chevron_left,
                        color: colors.TEXT_WHITE,
                        size: values.BUTTON_TEXT,
                      ),
                      Text(
                        '  Prev ',
                        style: TextStyle(
                          color: colors.TEXT_WHITE,
                          fontSize: values.BUTTON_TEXT,
                          fontWeight: FontWeight.w500,
                          height: 1.25,
                        ),
                      ),
                    ],
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: colors.YELLOW,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(values.RADIUS),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 4.0,
                    ),
                  ),
                ),
                Expanded(child: Container()),
                TextButton(
                  onPressed: onNext,
                  child: Row(
                    children: const [
                      Text(
                        ' Next  ',
                        style: TextStyle(
                          color: colors.TEXT_WHITE,
                          fontSize: values.BUTTON_TEXT,
                          fontWeight: FontWeight.w500,
                          height: 1.25,
                        ),
                      ),
                      Icon(
                        CupertinoIcons.chevron_right,
                        color: colors.TEXT_WHITE,
                        size: values.BUTTON_TEXT,
                      ),
                    ],
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: colors.BUTTON_BLUE,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(values.RADIUS),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 4.0,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 120),
          ],
        ),
      ),
    );
  }
}
