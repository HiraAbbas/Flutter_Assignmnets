import 'package:flutter/material.dart';
import 'package:property_trade_app_ui/views/profile.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                   Row(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
              children: [
                
                IconButton(
                  //padding: EdgeInsets.zero,
                  icon: Icon(Icons.arrow_back),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://blogger.googleusercontent.com/img/a/AVvXsEhKnMpHHkukLTOmgb1piySSgo9He9REnqmDOie_fZPvJmDN_v-mJy8M63tOC2reusd4fBDruY4yy7mLnEozHJaZh-8csxdt59MGPSvd6pvoFlijYwsUD8gf4GB-lv3780RnKp3uZXq_o2K7IIFE7KDgUQHoDXlWr4AFfOq2KSsm3qst8fyKwZWPSfX5"),
                    radius: 80,
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Login to Your Account',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40.0),
                  TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email_rounded),
                      labelText: 'Email',
                    ),
                  ),
                  SizedBox(height: 10.0),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.visibility),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: true,
                        onChanged: (value) {},
                      ),
                      Text('Remember me'),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileScreen()),
                      );
                    },
                    child: Text('Sign In'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                       shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  TextButton(
                    onPressed: () {},
                    child: Text('Forgot Password?'),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'or continue with',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          // handle Google login button press
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 20.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons
                                    .facebook, // replace with the Google logo icon
                                color: Colors.blue, // set icon color
                              ),
                              const SizedBox(width: 8.0),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          // handle Google login button press
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 20.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons
                                    .search, // replace with the Google logo icon
                                color: Colors.black, // set icon color
                              ),
                              const SizedBox(width: 8.0),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          // handle Google login button press
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 20.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons
                                    .apple, // replace with the Google logo icon
                                color: Colors.black, // set icon color
                              ),
                              const SizedBox(width: 8.0),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                    ],
                  ),
                ])));
  }
}
