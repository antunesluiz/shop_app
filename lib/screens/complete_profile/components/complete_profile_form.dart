import 'package:flutter/material.dart';
import 'package:shop_app/components/custom_suffix_icon.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/components/form_error.dart';
import 'package:shop_app/themes/constants.dart';
import 'package:shop_app/themes/size_config.dart';

class CompleteProfileForm extends StatefulWidget {
  const CompleteProfileForm({Key? key}) : super(key: key);

  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  late String firstName, lastName, phoneNumber, address;

  void removeError({required String error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  void addError({required String error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          firstNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          lastNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          phoneNumberFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          addressFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: "Continue",
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
              }
            },
          )
        ],
      ),
    );
  }

  TextFormField addressFormField() {
    return TextFormField(
      keyboardType: TextInputType.streetAddress,
      onSaved: (newValue) => firstName = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kAddressNullError);
        }

        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kAddressNullError);

          return "";
        }

        return null;
      },
      decoration: InputDecoration(
        hintText: 'Enter your address',
        labelText: 'Address',
        suffixIcon: CustomSuffixIcon(icon: 'assets/icons/LocationPoint.svg'),
      ),
    );
  }

  TextFormField phoneNumberFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => phoneNumber = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        }

        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPhoneNumberNullError);

          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: 'Enter your phone',
        labelText: 'Phone Number',
        suffixIcon: CustomSuffixIcon(icon: 'assets/icons/Phone.svg'),
      ),
    );
  }

  TextFormField lastNameFormField() {
    return TextFormField(
      keyboardType: TextInputType.name,
      onSaved: (newValue) => lastName = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kLastNameNullError);
        }

        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kLastNameNullError);

          return "";
        }

        return null;
      },
      decoration: InputDecoration(
        hintText: 'Enter your last name',
        labelText: 'Last Name',
        suffixIcon: CustomSuffixIcon(icon: 'assets/icons/User.svg'),
      ),
    );
  }

  TextFormField firstNameFormField() {
    return TextFormField(
      keyboardType: TextInputType.name,
      onSaved: (newValue) => firstName = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNamelNullError);
        }

        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kNamelNullError);

          return "";
        }

        return null;
      },
      decoration: InputDecoration(
        hintText: 'Enter your first name',
        labelText: 'First Name',
        suffixIcon: CustomSuffixIcon(icon: 'assets/icons/User.svg'),
      ),
    );
  }
}
