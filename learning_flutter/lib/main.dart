import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case HomePage.route:
            return MaterialPageRoute(
                builder: (context) => Scaffold(
                      body: Container(
                        color: Colors.amber,
                        child: const Text("home"),
                      ),
                    ),
                settings: const RouteSettings(name: HomePage.route));
        }
      },
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  static const String route = "/home";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _pageIndex = 0;
  int _drawerIndex = 0;
  List<int> screenStack = [0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("page $_pageIndex"),
      ),
      body: SafeArea(
        child: WillPopScope(
          onWillPop: () async {
            if (screenStack.length > 1) {
              setState(() {
                screenStack.removeLast();
                _pageIndex = screenStack[screenStack.length - 1];
              });
              return false;
            }
            return true;
          },
          child: IndexedStack(
            index: (_drawerIndex < _pageIndex) ? _pageIndex : _drawerIndex,
            children: <Widget>[
              Container(
                color: Colors.amber,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Scaffold(
                                        body: Center(
                                          child: Text("DetailsPage"),
                                        ),
                                      )));
                        },
                        child: const Text("navigate"),
                      ),
                      const Text('Home'),
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.green,
                child: const Center(child: Text('Business')),
              ),
              Container(
                color: Colors.amber,
                child: const Center(child: Text('Technology')),
              ),
              // Container(
              //   color: Colors.blueAccent,
              //   child: const Center(child: Text('Education')),
              // ),
              const AttendanceScreen(),
              Container(
                color: Colors.deepOrange,
                child: const Center(child: Text('Others')),
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              ListTile(
                onTap: () {
                  Navigator.of(context).pop();
                  setState(
                    () {
                      _pageIndex = 0;
                      _drawerIndex = _pageIndex;
                      if (_pageIndex == 0) {
                        screenStack = [0];
                      } else if (!screenStack.contains(_pageIndex)) {
                        screenStack.add(_pageIndex);
                      }
                    },
                  );
                },
                title: const Text("Home"),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).pop();
                  setState(
                    () {
                      _pageIndex = 1;
                      _drawerIndex = _pageIndex;
                      if (_pageIndex == 0) {
                        screenStack = [0];
                      } else if (!screenStack.contains(_pageIndex)) {
                        screenStack.add(_pageIndex);
                      }
                    },
                  );
                },
                title: const Text("Business"),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).pop();
                  setState(
                    () {
                      _pageIndex = 2;
                      _drawerIndex = _pageIndex;
                      if (_pageIndex == 0) {
                        screenStack = [0];
                      } else if (!screenStack.contains(_pageIndex)) {
                        screenStack.add(_pageIndex);
                      }
                    },
                  );
                },
                title: const Text("Technology"),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).pop();
                  setState(
                    () {
                      _pageIndex = 3;
                      _drawerIndex = _pageIndex;
                      if (_pageIndex == 0) {
                        screenStack = [0];
                      } else if (!screenStack.contains(_pageIndex)) {
                        screenStack.add(_pageIndex);
                      }
                    },
                  );
                },
                title: const Text("Education"),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).pop();
                  setState(
                    () {
                      _drawerIndex = 4;
                    },
                  );
                },
                title: const Text("Others"),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.computer),
            label: 'Technology',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Education',
          ),
        ],
        currentIndex: _pageIndex,
        onTap: (int index) {
          setState(
            () {
              _pageIndex = index;
              _drawerIndex = _pageIndex;
              if (_pageIndex == 0) {
                screenStack = [0];
              } else if (!screenStack.contains(_pageIndex)) {
                screenStack.add(_pageIndex);
              }
            },
          );
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class DetailRoute extends StatelessWidget {
  late TextEditingController? textEditingController;
  int? index;

  DetailRoute({Key? key, this.textEditingController, this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({Key? key}) : super(key: key);

  @override
  _AttendanceScreenState createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  static var countdownDuration = const Duration(minutes: 10);
  static var countdownDuration1 = const Duration(minutes: 10);
  Duration duration = const Duration();
  Duration duration1 = const Duration();
  Timer? timer;
  Timer? timer1;
  bool countDown = true;
  bool countDown1 = true;

  @override
  void initState() {
    
    var hours;
    var mints;
    var secs;
    hours = int.parse("00");
    mints = int.parse("00");
    secs = int.parse("00");
    countdownDuration = Duration(hours: hours, minutes: mints, seconds: secs);
    startTimer();
    reset();
    var hours1;
    var mints1;
    var secs1;
    hours1 = int.parse("10");
    mints1 = int.parse("00");
    secs1 = int.parse("00");
    countdownDuration1 =
        Duration(hours: hours1, minutes: mints1, seconds: secs1);
    startTimer1();
    reset1();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Container(
          color: Colors.black12,
          width: double.infinity,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Timer",
                  style: TextStyle(fontSize: 25),
                ),
                Container(
                    margin:const EdgeInsets.only(top: 30, bottom: 30),
                    child: buildTime()),
                const SizedBox(
                  height: 20,
                ),
               const Text(
                  "Count down timer",
                  style: TextStyle(fontSize: 25),
                ),
                Container(
                    margin:const EdgeInsets.only(top: 30, bottom: 30),
                    child: buildTime1()),
              ]),
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    final isRunning = timer == null ? false : timer!.isActive;
    if (isRunning) {
      timer!.cancel();
    }
    Navigator.of(context, rootNavigator: true).pop(context);
    return true;
  }

  void reset() {
    if (countDown) {
      setState(() => duration = countdownDuration);
    } else {
      setState(() => duration = Duration());
    }
  }

  void reset1() {
    if (countDown) {
      setState(() => duration1 = countdownDuration1);
    } else {
      setState(() => duration1 = const Duration());
    }
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) => addTime());
  }

  void startTimer1() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) => addTime1());
  }

  void addTime() {
    const addSeconds = 1;
    setState(() {
      final seconds = duration.inSeconds + addSeconds;
      if (seconds < 0) {
        timer?.cancel();
      } else {
        duration = Duration(seconds: seconds);
      }
    });
  }

  void addTime1() {
    const addSeconds = 1;
    setState(() {
      final seconds = duration1.inSeconds - addSeconds;
      if (seconds < 0) {
        timer1?.cancel();
      } else {
        duration1 = Duration(seconds: seconds);
      }
    });
  }

  Widget buildTime() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      buildTimeCard(time: hours, header: 'HOURS'),
      const SizedBox(
        width: 8,
      ),
      buildTimeCard(time: minutes, header: 'MINUTES'),
      const SizedBox(
        width: 8,
      ),
      buildTimeCard(time: seconds, header: 'SECONDS'),
    ]);
  }

  Widget buildTime1() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration1.inHours);
    final minutes = twoDigits(duration1.inMinutes.remainder(60));
    final seconds = twoDigits(duration1.inSeconds.remainder(60));
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      buildTimeCard(time: hours, header: 'HOURS'),
      const SizedBox(
        width: 8,
      ),
      buildTimeCard(time: minutes, header: 'MINUTES'),
      const SizedBox(
        width: 8,
      ),
      buildTimeCard(time: seconds, header: 'SECONDS'),
    ]);
  }

  Widget buildTimeCard({required String time, required String header}) =>
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Text(
              time,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 50),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Text(header, style: const TextStyle(color: Colors.black45)),
        ],
      );
}
