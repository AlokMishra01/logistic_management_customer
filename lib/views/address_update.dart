import 'package:flutter/material.dart';
import 'package:logistic_management_customer/constants/enums.dart';
import 'package:logistic_management_customer/controllers/profile_controller.dart';
import 'package:logistic_management_customer/widgets/custom_button.dart';
import 'package:logistic_management_customer/widgets/custom_input.dart';
import 'package:logistic_management_customer/widgets/dialogs/bottom_dialog.dart';
import 'package:logistic_management_customer/widgets/dialogs/loading_dialog.dart';
import 'package:provider/provider.dart';

import '../constants/values.dart' as values;
import '../widgets/header.dart';

class AddressUpdate extends StatefulWidget {
  const AddressUpdate({Key? key}) : super(key: key);

  @override
  State<AddressUpdate> createState() => _AddressUpdateState();
}

class _AddressUpdateState extends State<AddressUpdate> {
  final TextEditingController _city = TextEditingController();
  final TextEditingController _street = TextEditingController();
  final TextEditingController _province = TextEditingController();
  final TextEditingController _district = TextEditingController();
  final TextEditingController _country = TextEditingController();

  @override
  void initState() {
    super.initState();
    final profile = context.read<ProfileController>();
    _city.text = profile.user?.city ?? '';
    _street.text = profile.user?.street ?? '';
    _province.text = profile.user?.province ?? '';
    _district.text = profile.user?.district ?? '';
    _country.text = profile.user?.country ?? '';
  }

  @override
  void dispose() {
    _city.dispose();
    _street.dispose();
    _province.dispose();
    _district.dispose();
    _country.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Header(
              backButton: true,
              title: 'Update Address',
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: values.BASE_PADDING),
                      CustomInput(
                        hint: "City",
                        controller: _city,
                        validator: (value) {
                          if ((value as String).isEmpty) {
                            return 'Please enter city';
                          }
                        },
                      ),
                      const SizedBox(height: values.BASE_PADDING),
                      CustomInput(
                        hint: "Street",
                        controller: _street,
                        validator: (value) {
                          if ((value as String).isEmpty) {
                            return 'Please enter street';
                          }
                        },
                      ),
                      const SizedBox(height: values.BASE_PADDING),
                      CustomInput(
                        hint: "Province",
                        controller: _province,
                        validator: (value) {
                          if ((value as String).isEmpty) {
                            return 'Please enter province';
                          }
                        },
                      ),
                      const SizedBox(height: values.BASE_PADDING),
                      CustomInput(
                        hint: "District",
                        controller: _district,
                        validator: (value) {
                          if ((value as String).isEmpty) {
                            return 'Please enter district';
                          }
                        },
                      ),
                      const SizedBox(height: values.BASE_PADDING),
                      CustomInput(
                        hint: "Country",
                        controller: _country,
                        validator: (value) {
                          if ((value as String).isEmpty) {
                            return 'Please enter country';
                          }
                        },
                      ),
                      const SizedBox(height: values.BASE_PADDING),
                      const SizedBox(height: values.BASE_PADDING * 1.5),
                      SizedBox(
                        height: 58.0,
                        child: CustomButton(
                          title: "UPDATE",
                          onTab: _update,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _update() async {
    FocusScope.of(context).requestFocus(FocusNode());
    if (_city.text.isEmpty) {
      showBottomDialog(
        context: context,
        dialogType: DialogType.ERROR,
        title: 'ERROR!',
        message: 'Please enter city',
      );
      return;
    }
    if (_street.text.isEmpty) {
      showBottomDialog(
        context: context,
        dialogType: DialogType.ERROR,
        title: 'ERROR!',
        message: 'Please enter street',
      );
      return;
    }
    if (_province.text.isEmpty) {
      showBottomDialog(
        context: context,
        dialogType: DialogType.ERROR,
        title: 'ERROR!',
        message: 'Please enter province',
      );
      return;
    }
    if (_district.text.isEmpty) {
      showBottomDialog(
        context: context,
        dialogType: DialogType.ERROR,
        title: 'ERROR!',
        message: 'Please enter district',
      );
      return;
    }
    if (_country.text.isEmpty) {
      showBottomDialog(
        context: context,
        dialogType: DialogType.ERROR,
        title: 'ERROR!',
        message: 'Please enter country',
      );
      return;
    }

    var progressDialog = getProgressDialog(context: context);
    progressDialog.show(useSafeArea: false);

    var result = await context.read<ProfileController>().updateAddress(
          province: _province.text,
          district: _district.text,
          country: _country.text,
          street: _street.text,
          city: _city.text,
        );

    progressDialog.dismiss();

    if (result) {
      showBottomDialog(
        context: context,
        dialogType: DialogType.SUCCESS,
        title: 'Update Successfully',
        message: 'Your address is updated successfully.',
      );
    } else {
      showBottomDialog(
        context: context,
        dialogType: DialogType.ERROR,
        title: 'Update Error',
      );
    }
  }
}
