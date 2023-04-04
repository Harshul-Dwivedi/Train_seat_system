import 'package:assignment_task/seatgrid_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController controller = TextEditingController();
  int? selectedSeat;

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Colors.lightGreen[600],
        title: const Text('Train Seat Selection'),
      ),
      endDrawer: Drawer(
        backgroundColor: Colors.lightGreen,
        child: ListView(
          children: const [
            ListTile(
              leading: CircleAvatar(
                radius: 25,
                backgroundImage:
                    AssetImage("assets/Naruto Live - Itachi Uchiha.jpg"),
              ),
              title: Text(
                'Harshul',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              subtitle: Text(
                'Developer',
              ),
              trailing: Icon(Icons.arrow_drop_down),
            ),
            Divider(
              color: Colors.black54,
            ),
            ListTile(
              title: Text(
                'DASHBOARD',
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              title: Text(
                'About',
                style: TextStyle(color: Colors.white),
              ),
              trailing: Icon(Icons.info_outline),
            ),
            ListTile(
              title: Text(
                'Settings',
                style: TextStyle(color: Colors.white),
              ),
              trailing: Icon(Icons.settings),
            ),
            ListTile(
              title: Text(
                'Logout',
                style: TextStyle(color: Colors.white),
              ),
              trailing: Icon(Icons.logout),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 250,
                    child: TextFormField(
                      controller: controller,
                      decoration: const InputDecoration(
                        hintStyle: TextStyle(fontWeight: FontWeight.bold),
                        hintText: 'Search any seat ...',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.green[500]),
                    onPressed: () {
                      final sn = int.tryParse(controller.text);
                      if (sn != null && sn <= 108 && sn > 0) {
                        FocusScope.of(context).unfocus();
                        setState(() {
                          selectedSeat = sn;
                        });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please add seats between 1 to 108'),
                          ),
                        );
                      }
                    },
                    child: const Text('Search'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Expanded(
                child: SeatGridPage(
              selectedSeatNumber: selectedSeat,
            )),
          ],
        ),
      ),
    );
  }
}
