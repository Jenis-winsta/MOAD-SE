import 'package:flutter/material.dart';


class NotificationPage extends StatelessWidget {
  final List<NotificationData> notifications = [    
  NotificationData('Notification 1', 'Notification details 1'),    
  NotificationData('Notification 2', 'Notification details 2'),    
  NotificationData('Notification 4', 'Notification details 3'), 
  NotificationData('Notification 5', 'Notification details 3'), 
  NotificationData('Notification 6', 'Notification details 3'), 
  NotificationData('Notification 7', 'Notification details 3'), 
  NotificationData('Notification 8', 'Notification details 3'), 
  
  
  ] ;  // Add more notifications as needed  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Notifications'),
      // ),
      body: SingleChildScrollView(
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),//the individual listview should not be scrolled independently
          shrinkWrap: true, //to avoid overflow of listview
          itemCount: notifications.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: Icon(Icons.notifications),
              title: Text(notifications[index].title),
              subtitle: Text(notifications[index].details),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        NotificationDetailsPage(notifications[index]),
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

class NotificationData {
  final String title;
  final String details;

  NotificationData(this.title, this.details);
}

class NotificationDetailsPage extends StatelessWidget {
  final NotificationData notificationData;

  NotificationDetailsPage(this.notificationData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification Details'),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              notificationData.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(height: 16),
            Text(notificationData.details),
          ],
        ),
      ),
    );
  }
}
