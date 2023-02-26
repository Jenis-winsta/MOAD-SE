import 'package:flutter/material.dart';

class Vacancy extends StatelessWidget {
  const Vacancy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vacancy"),
      ),
      body: VacancyPage(),
    );
  }
}


class VacancyPage extends StatelessWidget {
  final List<VacancyData> Vacancys = [
    VacancyData('Manager', '5 years experience in sales ',
        'Experience in execution of projects'),
    VacancyData('C++ Developer', '3 years of experience in an IT company',
        'Should Have worked in GUI Development'),
    VacancyData(
        'Full Stack Developer', '2 years of experience', 'Work from Home'),
    VacancyData('Accountant', '4 years of experience', 'Good in sql'),
    VacancyData(
        'Salesperson', '2 years of experience in sales', 'Work from Home'),
    VacancyData('Back End Developer', '3 years of experience',
        'Work in Managing Databases'),
    VacancyData(
        'Graphic designer', '3 years of experience', 'Expert in Photoshop'),
  ]; // Add more Vacancys as needed  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Vacancys'),
      // ),
      body: SingleChildScrollView(
        child: ListView.builder(
          physics:
              NeverScrollableScrollPhysics(), //the individual listview should not be scrolled independently
          shrinkWrap: true, //to avoid overflow of listview
          itemCount: Vacancys.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: Icon(Icons.work),
              title: Text(Vacancys[index].title),
              subtitle: Text(Vacancys[index].details),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        VacancyDetailsPage(Vacancys[index]),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class VacancyData {
  final String title;
  final String details;
  final String description;

  VacancyData(this.title, this.details, this.description);
}

class VacancyDetailsPage extends StatelessWidget {
  final VacancyData;

  VacancyDetailsPage(this.VacancyData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vacancy Details'),
        // backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              VacancyData.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            
            SizedBox(height: 16),
            Text(VacancyData.details),
            SizedBox(height: 16),
            Text(VacancyData.description),
            Container(
              margin: EdgeInsets.all(90),
              child: ElevatedButton(
                child: Text(
                  'Apply',
                  style: TextStyle(fontSize: 20.0,color: Colors.white, fontStyle: FontStyle.normal),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  padding: EdgeInsets.all(18),
                ),

                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}