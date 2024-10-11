import 'package:flutter/material.dart';
import 'package:help_scout_beacon/help_scout_beacon.dart';
import 'package:help_scout_beacon/help_scout_beacon_api.g.dart';

/// YOUR HELPSCOUT BEACON ID
const String yourBeaconId = "";

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _formKey = GlobalKey<FormState>();
  final HelpScoutBeacon beacon = HelpScoutBeacon(
    HSBeaconSettings(beaconId: yourBeaconId, debugLogging: true),
  );

  @override
  Widget build(BuildContext context) {
    const spacer = SizedBox(height: 16, width: 16);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Help Scout Plugin'),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Enter your beacon id
              const Text("BeaconId: \n$yourBeaconId"),

              spacer,

              // Start a beacon ui
              ElevatedButton(
                onPressed: () => beacon.open(),
                child: const Text('Open (Default)'),
              ),
              spacer,

              ElevatedButton(
                onPressed: () => beacon.open(route: HSBeaconRoute.ask),
                child: const Text('Open Ask'),
              ),
              spacer,

              ElevatedButton(
                onPressed: () => beacon.open(route: HSBeaconRoute.chat),
                child: const Text('Open Chat'),
              ),
              spacer,

              ElevatedButton(
                onPressed: () => beacon.open(route: HSBeaconRoute.docs),
                child: const Text('Open Docs'),
              ),
              spacer,

              ElevatedButton(
                onPressed: () =>
                    beacon.open(route: HSBeaconRoute.docs, parameter: 'Help'),
                child: const Text('Open Docs (+search term)'),
              ),
              spacer,

              ElevatedButton(
                onPressed: () => beacon.open(route: HSBeaconRoute.contactForm),
                child: const Text('Open Contact Form'),
              ),
              spacer,

              ElevatedButton(
                onPressed: () =>
                    beacon.open(route: HSBeaconRoute.previousMessages),
                child: const Text('Open Previous Messages'),
              ),

              const SizedBox(height: 32),
              const Divider(),
              // Clear everything
              const Text('You can scroll horizontal'),
              const SizedBox(height: 10),

              SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FilledButton(
                      onPressed: () => beacon.identify(
                        beaconUser: HSBeaconUser(
                          email: "john.doe@example.com",
                          name: "John Doe",
                        ),
                      ),
                      child: const Text('Set User'),
                    ),
                    const SizedBox(width: 16),
                    FilledButton(
                      onPressed: () => beacon.addSession(
                        session: HSBeaconSession(
                          attributes: {
                            "team_id": '9999',
                            "team_name": 'Beauty (L)',
                            "team_mode": 'BASIC',
                            "user_id": '1234',
                            "user_name": 'Frog',
                          },
                        ),
                      ),
                      child: const Text('Set Session'),
                    ),
                    const SizedBox(width: 16),
                    FilledButton(
                      onPressed: () => beacon.addPreFilled(
                        form: HSBeaconForm(
                          name: 'User name',
                          subject: 'Subject',
                          message: 'Message',
                          email: 'example@exam.com',
                        ),
                      ),
                      child: const Text('Set Form'),
                    ),
                    const SizedBox(width: 16),
                    FilledButton(
                      onPressed: clearBeacon,
                      child: const Text('Clear'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void>? clearBeacon() async {
    await beacon.clear();
  }

  bool isFormValid() {
    return _formKey.currentState?.validate() ?? false;
  }
}
