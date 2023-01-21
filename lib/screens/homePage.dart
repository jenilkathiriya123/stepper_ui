import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<FormState> key = GlobalKey<FormState>();
  GlobalKey<FormState> keys = GlobalKey<FormState>();

  String? name;
  String? email;
  String? emails;
  String? password;
  String? pass;
  String? confirm;

  int iniIndax = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Application"),
        backgroundColor: Color(0xfff54437),
        elevation: 0,
      ),
      body: Stepper(
        controlsBuilder: (context, control) => Row(
          children: [
            if (iniIndax == 2)
              ...{}
            else ...{
              ElevatedButton(
                onPressed: control.onStepContinue,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    const Color(0xfff54437),
                  ),
                ),
                child: const Text("Continue"),
              ),
              SizedBox(width: 10),
              OutlinedButton(
                onPressed: control.onStepCancel,
                child: Text("Cancel"),
              ),
            }
          ],
        ),
        onStepContinue: () {
          setState(() {
            if (iniIndax == 0) {
              if (key.currentState!.validate()) {
                key.currentState!.save();
                ++iniIndax;
              }
            } else if (iniIndax == 1) {
              if (keys.currentState!.validate()) {
                keys.currentState!.save();
                ++iniIndax;
                Navigator.pushNamed(context, 'profile');
              }
            }
          });
        },
        onStepCancel: () {
          setState(() {
            if (iniIndax > 0) {
              --iniIndax;
            }
          });
        },
        onStepTapped: (val) {
          setState(() {
            iniIndax = val;
          });
        },
        currentStep: iniIndax,
        steps: [
          Step(
            title: Text("Signup"),
            content: Form(
              key: key,
              child: Column(
                children: [
                  SizedBox(height: 30),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    onSaved: (val) {
                      setState(() {
                        name = val;
                      });
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: "Full Name",
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    onSaved: (val) {
                      setState(() {
                        email = val;
                      });
                    },
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter your email";
                      } else {
                        return null;
                      }
                    },
                    decoration: const InputDecoration(
                      hintText: "Email id",
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    obscureText: true,
                    textInputAction: TextInputAction.next,
                    onChanged: (val) {
                      setState(() {
                        password = val;
                      });
                    },
                    onSaved: (val) {
                      setState(() {
                        password = val;
                      });
                    },
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter your password";
                      } else {
                        return null;
                      }
                    },
                    decoration: const InputDecoration(
                      hintText: "Password *",
                      prefixIcon: Icon(Icons.lock_outline),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    obscureText: true,
                    onSaved: (val) {
                      setState(() {
                        confirm = val;
                      });
                    },
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter your password";
                      } else if (val == password) {
                        return null;
                      } else if (val != password) {
                        return "Enter proper password";
                      } else {
                        return null;
                      }
                    },
                    decoration: const InputDecoration(
                      hintText: "Confirm Password",
                      prefixIcon: Icon(Icons.lock_outlined),
                    ),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
          Step(
            title: Text("Login"),
            content: Form(
              key: keys,
              child: Column(
                children: [
                  SizedBox(height: 30),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    onChanged: (val) {
                      setState(() {
                        email = val;
                      });
                    },
                    onSaved: (val) {
                      setState(() {
                        email = val;
                      });
                    },
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter your email";
                      } else if (val != email) {
                        return "Type proper email";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      hintText: "Email id",
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    obscureText: true,
                    onChanged: (val) {
                      setState(() {
                        pass = val;
                      });
                    },
                    onSaved: (val) {
                      setState(() {
                        pass = val;
                      });
                    },
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter your password";
                      } else if (val != password) {
                        return "Type proper password";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      hintText: "Password *",
                      prefixIcon: Icon(Icons.lock_outline),
                    ),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
          Step(
            isActive: false,
            state: StepState.complete,
            title: Text("Home"),
            content: Text(""),
          ),
        ],
      ),
    );
  }
}
