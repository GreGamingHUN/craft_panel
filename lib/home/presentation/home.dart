import 'package:craft_panel/global/globals.dart';
import 'package:exaroton_api/exaroton_api.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ExarotonClient client = Globals.exarotonClient;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CraftPanel"),
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: "Server List",
        ),
      ]),
      body: FutureBuilder(
        future: client.serverService.getServers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }
          final servers = snapshot.data as List<Server>;
          return ListView.builder(
              itemCount: servers.length,
              itemBuilder: (context, index) {
                final server = servers[index];
                return ServerCard(server: server);
              });
        },
      ),
    );
  }
}

class ServerCard extends StatelessWidget {
  const ServerCard({
    super.key,
    required this.server,
  });

  final Server server;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: getServerStatusColor(server.status),
              spreadRadius: -4,
              blurRadius: 0, // Sharp shadow with no blur
              offset: const Offset(7, 7), // Diagonal offset
            ),
          ],
        ),
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.black, width: 1),
            borderRadius: BorderRadius.circular(0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(server.name),
                    Text(server.id),
                  ],
                ),
                Column(
                  children: [
                    Text(
                        "Players: ${server.onlinePlayers}/${server.maxPlayers}"),
                    Text("Status: ${ServerStatus.getServerStatusFromValue(server.status)}"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  getServerStatusColor(int status) {
    switch (status) {
      case ServerStatus.online:
        return Colors.green;
      case ServerStatus.offline:
        return Colors.red;
      case ServerStatus.loading:
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }
}
