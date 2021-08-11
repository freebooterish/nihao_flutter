import 'package:flutter/material.dart';

class FormDemo extends StatelessWidget {
  // const FormDemo({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Apply the given theme [data] to [child] 只覆盖一部分主题内容
      body: Theme(
        data: Theme.of(context).copyWith(
          primaryColor: Colors.black,
        ),
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // TextFieldDemo(),
              RegisterForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class ThemeDemo extends StatelessWidget {
  // const ThemeDemo({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).accentColor,
    );
  }
}

class TextFieldDemo extends StatefulWidget {
  TextFieldDemo({Key? key}) : super(key: key);

  @override
  _TextFieldDemoState createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {
  final textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // textEditingController.text = 'hi';
    // addListener和onChanged效果一样
    textEditingController.addListener(() {
      debugPrint('${textEditingController.text}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: textEditingController,
        // onChanged: (value) {
        //   debugPrint('$value');
        // },
        onSubmitted: (value) => debugPrint('Submintted: $value'),
        decoration: InputDecoration(
          icon: Icon(Icons.subject),
          labelText: 'Title',
          hintText: 'Enter post title',
          // border: InputBorder.none),
          // border: OutlineInputBorder(),
          filled: true,
        ));
  }
}

class RegisterForm extends StatefulWidget {
  // RegisterForm({Key? key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  // 添加一个global key,可以使用key去引用表单
  final registerFormKey = GlobalKey<FormState>();
  String username = '', password = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: registerFormKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: '用户名：', helperText: ''),
            onSaved: (value) => username = value!,
            validator: validateUsername,
            // autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
          TextFormField(
            obscureText: true,
            onSaved: (value) => password = value!,
            decoration: InputDecoration(labelText: '密码：', helperText: ''),
            validator: validatePassword,
          ),
          SizedBox(height: 32.0),
          Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: submitRegisterForm,
                child: Text('Register', style: TextStyle(color: Colors.white)),
              )),
        ],
      ),
    );
  }

  void submitRegisterForm() {
    if (registerFormKey.currentState!.validate()) {
      registerFormKey.currentState!.save();
      debugPrint('username: $username,password: $password');
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Registering...')));
    } else {
      debugPrint('Username and password are required');
    }
  }

  String? validateUsername(String? value) {
    if (value!.isEmpty) {
      return 'Username is required';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return 'Password is required.';
    }
    return null;
  }
}
