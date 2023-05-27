import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
           
            Text(
              'Fill Your Profile',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.0),
            Stack(
              
              children: [
                Padding(padding: EdgeInsets.all(20.0)),
                CircleAvatar(
                  radius: 80.0,
                  backgroundImage:
                    NetworkImage("https://blogger.googleusercontent.com/img/a/AVvXsEhKnMpHHkukLTOmgb1piySSgo9He9REnqmDOie_fZPvJmDN_v-mJy8M63tOC2reusd4fBDruY4yy7mLnEozHJaZh-8csxdt59MGPSvd6pvoFlijYwsUD8gf4GB-lv3780RnKp3uZXq_o2K7IIFE7KDgUQHoDXlWr4AFfOq2KSsm3qst8fyKwZWPSfX5")
                ),
                Positioned(
                  right: 0.0,
                  bottom: 0.0,
                  child: IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      // Add functionality to edit profile picture
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            
          
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Full Name',
              ),
            ),
            SizedBox(height: 8.0),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Nickname',
              ),
            ),
            SizedBox(height: 8.0),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Date of Birth',
                suffixIcon: Icon(Icons.calendar_today),
              ),
            ),
            SizedBox(height: 8.0),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
                suffixIcon: Icon(Icons.email),
              ),
            ),
            SizedBox(height: 8.0),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Gender',
                //suffixIcon: Icon(Icons.arrow_drop_down),
              ),
              items: ['Male', 'Female', 'Other']
                  .map((gender) => DropdownMenuItem(
                        value: gender,
                        child: Text(gender),
                      ))
                  .toList(),
              onChanged: (selectedGender) {
                // Add functionality when gender is selected
              },
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Add functionality to continue
              },
              child: Text('Continue'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[800],
                padding: EdgeInsets.symmetric(vertical: 15.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
