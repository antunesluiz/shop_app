import 'package:flutter/material.dart';
import 'package:shop_app/components/custom_suffix_icon.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/components/forgot_password_text.dart';
import 'package:shop_app/components/form_error.dart';
import 'package:shop_app/screens/login_success/LoginSuccessScreen.dart';
import 'package:shop_app/services/api_services.dart';
import 'package:shop_app/themes/constants.dart';
import 'package:shop_app/themes/size_config.dart';

class SignForm extends StatefulWidget {
  const SignForm({Key? key}) : super(key: key);

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final List<String> errors = [];

  late String email, password;
  late bool remember = false;

  late ApiServices apiServices;

  @override
  void initState() {
    apiServices = ApiServices();

    super.initState();
  }

  @override
  void dispose() {
    apiServices.close();

    super.dispose();
  }

  void login(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      apiServices.login(email: email, password: password).then(
        (value) {
          if (value.token != null) {
            Navigator.pushNamed(
              context,
              LoginSuccessScreen.routeName,
            );
          } else {
            if (value.error != null) {
              final SnackBar snackBar = SnackBar(
                content: Text(
                  value.error.toString(),
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              );

              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          }
        },
      ).catchError((error) {
        final SnackBar snackBar = SnackBar(
          content: Text(
            'Please, try again!',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: kPrimaryColor,
                onChanged: (value) {
                  setState(() {
                    remember = value!;
                  });
                },
              ),
              Text('Remerber me'),
              Spacer(),
              ForgotPasswordText(),
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: 'Continue',
            onPressed: () {
              login(context);
            },
          )
        ],
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kEmailNullError)) {
          setState(() {
            errors.remove(kEmailNullError);
          });
        } else if (emailValidatorRegExp.hasMatch(value) &&
            errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.remove(kInvalidEmailError);
          });
        }

        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          setState(() {
            if (!errors.contains(kEmailNullError)) errors.add(kEmailNullError);
          });
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          setState(() {
            if (!errors.contains(kInvalidEmailError))
              errors.add(kInvalidEmailError);
          });
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
          setState(() {
            if (!errors.contains(kPassNullError)) errors.add(kPassNullError);
          });

          return "";
        } else if (value.length < 8) {
          setState(() {
            if (!errors.contains(kShortPassError)) errors.add(kShortPassError);
          });

          return "";
        }

        return null;
      },
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kPassNullError)) {
          setState(() {
            errors.remove(kPassNullError);
          });
        } else if (value.length >= 8 && errors.contains(kShortPassError)) {
          setState(() {
            errors.remove(kShortPassError);
          });
        }

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
}
