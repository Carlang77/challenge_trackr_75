// I'm importing necessary Flutter packages and pages for the app.
import 'package:flutter/material.dart';
import 'view/habits_page.dart'; // This is for the Habits page.
import 'view/stats_page.dart'; // This is for the Stats page.
import 'view/settings_page.dart'; // This is for the Settings page.
import 'view/calendar_stats_page.dart'; // This is for additional navigation to the Calendar Stats page.

// Here's where everything starts, the main function.
void main() {
  runApp(MyApp()); // I'm running MyApp, which sets up the app environment.
}

// MyApp is a simple, stateless widget. It doesn't change over time.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Here, I build the visual structure of MyApp.
    return MaterialApp(
      title: '75 Hard Challenge', // This is what you see in the recent apps.
      theme: ThemeData(
        primarySwatch: Colors.blue, // I've chosen blue as the main theme color.
        visualDensity: VisualDensity
            .adaptivePlatformDensity, // This helps with different screen densities.
      ),
      home: MyHomePage(), // MyHomePage is the first screen users will see.
    );
  }
}

// MyHomePage can change its state, hence it's a StatefulWidget.
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() =>
      _MyHomePageState(); // This line sets up its mutable state.
}

// This is where the magic happens for MyHomePage.
class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController; // I'm using this to manage tab selection.

  @override
  void initState() {
    super.initState(); // Always start with super.initState in initState method.
    _tabController = TabController(
        length: 3,
        vsync:
            this); // Setting up 3 tabs with this context for synchronization.
  }

  @override
  Widget build(BuildContext context) {
    // Now, I'm building MyHomePage's structure.
    return Scaffold(
      appBar: AppBar(
        title: Text('75 Hard Challenge'), // The title you see at the top.
        actions: [
          IconButton(
            icon: Icon(
                Icons.calendar_today), // This button looks like a calendar.
            onPressed: () {
              // When tapped, it does the following:
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        CalendarStatsPage()), // It takes you to the CalendarStatsPage.
              );
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController, // This is how I switch between tabs.
          tabs: [
            Tab(
                icon: Icon(Icons.list),
                text: 'Habits'), // First tab for Habits.
            Tab(
                icon: Icon(Icons.show_chart),
                text: 'Stats'), // Second tab for Stats.
            Tab(
                icon: Icon(Icons.settings),
                text: 'Settings'), // Third tab for Settings.
          ],
        ),
      ),
      body: TabBarView(
        controller:
            _tabController, // Same controller for consistent tab switching.
        children: [
          HabitsPage(), // Shows the Habits page content.
          StatsPage(), // Shows the Stats page content.
          SettingsPage(), // Shows the Settings page content.
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController
        .dispose(); // Clean up the controller when the widget is disposed.
    super.dispose(); // And always call super.dispose at the end of dispose.
  }
}
