import 'package:finalapp/Admin/pages/dashboard.dart';
import 'package:finalapp/Admin/pages/interview.dart';
import 'package:finalapp/Admin/pages/massEmail.dart';
import 'package:finalapp/Admin/pages/reportsAnalysis.dart';
import 'package:finalapp/Admin/pages/sendNotification.dart';
import 'package:finalapp/Admin/pages/settings.dart';
import 'package:finalapp/Admin/pages/supportAssistence.dart';
import 'package:flutter/material.dart';

// import 'package:Admin/pages/dashboard.dart';
// import 'package:admin/pages/interview.dart';
// import 'package:admin/pages/massEmail.dart';
// import 'package:admin/my_drawer_header.dart';
// import 'package:admin/pages/reportsAnalysis.dart';
// import 'package:admin/pages/sendNotification.dart';
// import 'package:admin/pages/settings.dart';
// import 'package:admin/pages/supportAssistence.dart';

import 'my_drawer_header.dart';


void main() {
  runApp(const Admin());
}

class Admin extends StatelessWidget {
  const Admin({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentPage = DrawerSections.dashboard;
  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.dashboard) {
      container = DashboardPage();
    } else if (currentPage == DrawerSections.interview) {
      container = InterviewPage();
    } else if (currentPage == DrawerSections.sendNotification) {
      container = SendNotificationPage();
    } else if (currentPage == DrawerSections.massEmail) {
      container = MassEmailPage();
    } else if (currentPage == DrawerSections.reportsAnalysis) {
      container = ReportsAnalysisPage();
    } else if (currentPage == DrawerSections.settings) {
      container = SettingsPage();
    } else if (currentPage == DrawerSections.supportAssistence) {
      container = SupportAssistencePage();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[700],
        title: Text("Alpha tech Admin Panel"),
        centerTitle: true,
      ),
      body: container,
      drawer: Drawer(
        child: Container(
          child: Column(
            children: [const MyHeaderDrawer(), MyDrawerList()],
          ),
        ),
      ),
    );
  }

//create a new dart file for drawer elements which returns the below and has a widget seperately inside it with menuItems
  Widget MyDrawerList() {
    return Container(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        //shows the list of menu drawer
        children: [
          menuItem(1, "Dashboard", Icons.dashboard,
              currentPage == DrawerSections.dashboard ? true : false),
          menuItem(2, "Interview", Icons.integration_instructions,
              currentPage == DrawerSections.interview ? true : false),
          menuItem(3, "Send Notification", Icons.notifications,
              currentPage == DrawerSections.sendNotification ? true : false),
          Divider(),
          menuItem(4, "Mass Email", Icons.email,
              currentPage == DrawerSections.massEmail ? true : false),
          menuItem(5, "Reports & Analysis", Icons.analytics,
              currentPage == DrawerSections.reportsAnalysis ? true : false),
          Divider(),
          menuItem(6, "Settings", Icons.settings_outlined,
              currentPage == DrawerSections.settings ? true : false),
          menuItem(7, "Support & assistence", Icons.contact_support,
              currentPage == DrawerSections.supportAssistence ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.dashboard;
            } else if (id == 2) {
              currentPage = DrawerSections.interview;
            } else if (id == 3) {
              currentPage = DrawerSections.sendNotification;
            } else if (id == 4) {
              currentPage = DrawerSections.massEmail;
            } else if (id == 5) {
              currentPage = DrawerSections.reportsAnalysis;
            } else if (id == 6) {
              currentPage = DrawerSections.settings;
            } else if (id == 7) {
              currentPage = DrawerSections.supportAssistence;
            }
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(children: [
            Expanded(
                child: Icon(
              icon,
              size: 20,
              color: Colors.black,
            )),
            Expanded(
              flex: 3,
              child: Text(
                title,
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
/*
enum DrawerSections {
  dashboard,
  FAQs,
  profile_update,
  settings,
  notification,
  privacy_policy,
  send_feedback
}*/

enum DrawerSections {
  dashboard,
  interview,
  sendNotification,
  massEmail,
  reportsAnalysis,
  settings,
  supportAssistence,

}

//planning to have a organization section where user can prioratise their company profiles
//as well custamise your app setting in swipe
