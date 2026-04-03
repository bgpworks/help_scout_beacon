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
  final HelpScoutBeacon beacon = HelpScoutBeacon(
    HSBeaconSettings(beaconId: yourBeaconId, debugLogging: true),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: const Color(0xFF1292EE),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Help Scout Beacon'),
          centerTitle: true,
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _buildSectionHeader('Beacon ID'),
            const Card(
              child: Padding(
                padding: EdgeInsets.all(12),
                child: SelectableText(
                  yourBeaconId,
                  style: TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 13,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            _buildSectionHeader('Navigation'),
            const SizedBox(height: 8),
            _buildNavButton(
              icon: Icons.home_outlined,
              label: 'Open Default',
              onPressed: () => beacon.open(),
            ),
            _buildNavButton(
              icon: Icons.question_answer_outlined,
              label: 'Open Ask',
              onPressed: () => beacon.open(route: HSBeaconRoute.ask),
            ),
            _buildNavButton(
              icon: Icons.chat_outlined,
              label: 'Open Chat',
              onPressed: () => beacon.open(route: HSBeaconRoute.chat),
            ),
            _buildNavButton(
              icon: Icons.menu_book_outlined,
              label: 'Open Docs',
              onPressed: () => beacon.open(route: HSBeaconRoute.docs),
            ),
            _buildNavButton(
              icon: Icons.search,
              label: 'Open Docs (search: "Help")',
              onPressed: () =>
                  beacon.open(route: HSBeaconRoute.docs, parameter: 'Help'),
            ),
            _buildNavButton(
              icon: Icons.mail_outlined,
              label: 'Open Contact Form',
              onPressed: () => beacon.open(route: HSBeaconRoute.contactForm),
            ),
            _buildNavButton(
              icon: Icons.history,
              label: 'Open Previous Messages',
              onPressed: () =>
                  beacon.open(route: HSBeaconRoute.previousMessages),
            ),
            const SizedBox(height: 24),
            _buildSectionHeader('Actions'),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: _buildActionChip(
                    icon: Icons.person_outlined,
                    label: 'Set User',
                    onPressed: () => beacon.identify(
                      beaconUser: HSBeaconUser(
                        email: 'john.doe@example.com',
                        name: 'John Doe',
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _buildActionChip(
                    icon: Icons.token_outlined,
                    label: 'Set Session',
                    onPressed: () => beacon.addSession(
                      session: HSBeaconSession(
                        attributes: {
                          'team_id': '9999',
                          'team_name': 'Beauty (L)',
                          'team_mode': 'BASIC',
                          'user_id': '1234',
                          'user_name': 'Frog',
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: _buildActionChip(
                    icon: Icons.edit_note,
                    label: 'Set Form',
                    onPressed: () => beacon.addPreFilled(
                      form: HSBeaconForm(
                        name: 'User name',
                        subject: 'Subject',
                        message: 'Message',
                        email: 'example@exam.com',
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _buildActionChip(
                    icon: Icons.refresh,
                    label: 'Reset Form',
                    onPressed: () => beacon.reset(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: _buildActionChip(
                icon: Icons.logout,
                label: 'Clear (Logout)',
                onPressed: () => beacon.clear(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 4),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }

  Widget _buildNavButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: FilledButton.tonal(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Row(
          children: [
            Icon(icon, size: 20),
            const SizedBox(width: 12),
            Text(label),
          ],
        ),
      ),
    );
  }

  Widget _buildActionChip({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 18),
          const SizedBox(width: 6),
          Flexible(child: Text(label, overflow: TextOverflow.ellipsis)),
        ],
      ),
    );
  }
}
