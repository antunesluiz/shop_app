import 'package:flutter/material.dart';
import 'package:shop_app/components/custom_suffix_icon.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/components/form_error.dart';
import 'package:shop_app/screens/complete_profile/CompleteProfileScreen.dart';
import 'package:shop_app/themes/constants.dart';
import 'package:shop_app/themes/size_config.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();

  final List<String> errors = [];
  late String email, password, confirmPassword;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildRePasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: "Continue",
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();

                Navigator.pushNamed(context, CompleteProfileScreen.routeName);
              }
            },
          )
        ],
      ),
    );
  }

  void removeError(error) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  void addError(error) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(kInvalidEmailError);
        }

        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(kEmailNullError);

          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(kInvalidEmailError);

          return "";
        }

        return null;
      },
      decoration: InputDecoration(
        hintText: 'Enter your email',
        labelText: 'Email',
        suffixIcon: CustomSuffixIcon(icon: 'assets/icons/Mail.svg'),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      onSaved: (newValue) => password = newValue!,
      validator: (value) {
        if (value!.isEmpty) {
          addError(kPassNullError);

          return "";
        } else if (value.length < 8) {
          addError(kShortPassError);

          return "";
        }

        return null;
      },
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(kPassNullError);
        }

        if (value.length >= 8) {
          removeError(kShortPassError);
        }

        password = value;

        return null;
      },
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Enter your password',
        labelText: 'Password',
        suffixIcon: CustomSuffixIcon(icon: 'assets/icons/Lock.svg'),
      ),
    );
  }

  TextFormField buildRePasswordFormField() {
    return TextFormField(
      onSaved: (newValue) => confirmPassword = newValue!,
      validator: (value) {
        if (value!.isEmpty) {
          return "";
        } else if (password != value) {
          addError(kMatchPassError);
          return "";
        }

        return null;
      },
      onChanged: (value) {
        confirmPassword = value;

        if (password == value) {
          removeError(kMatchPassError);
        }
        return null;
      },
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Re-Enter your password',
        labelText: 'Confirm Password',
        suffixIcon: CustomSuffixIcon(icon: 'assets/icons/Lock.svg'),
      ),
    );
  }
}
