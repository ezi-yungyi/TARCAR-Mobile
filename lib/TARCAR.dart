import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'WebServer/ServerService.dart';

class ParkingSpot {
  final int id;
  final String spotId;
  final bool occupied;
  final String? parkedAt;
  final String? leaveAt;

  ParkingSpot({
    required this.id,
    required this.spotId,
    required this.occupied,
    this.parkedAt,
    this.leaveAt,
  });

  // Factory method to create a ParkingSpot from JSON
  factory ParkingSpot.fromJson(Map<String, dynamic> json) {
    return ParkingSpot(
      id: json['id'],
      spotId: json['spot_id'],
      occupied: json['occupied'] == 'true' || json['occupied'] == true,
      parkedAt: json['parked_at'],
      leaveAt: json['leave_at'],
    );
  }
}

class TARCARPage extends StatefulWidget {
  @override
  _TARCARPageState createState() => _TARCARPageState();
}

class _TARCARPageState extends State<TARCARPage> {
  List<dynamic> parkingSpots = [];
  late ServerService _webSocketService;

  int fake_parked = 9; // Assume fake_parked corresponds to the parking spot ID

  @override
  void initState() {
    super.initState();
    fetchParkingData(); // Load parking data initially
    _fetchDoubleParkingData(); // Fetch double parking data
    _webSocketService = ServerService();
    _webSocketService.connect('wss://tarcar-broadcast.multixers.cloud/app/w3jnxnld3zaxbxwobmmn');
    _webSocketService.subscribeToChannel('parking-spot-status');
    _webSocketService.messageStream.listen((message) {
      // Handle incoming WebSocket message
      _handleParkingMessage(message);
    });
  }

  // Handle incoming WebSocket message and check for double-parked spots
  void _handleParkingMessage(String message) {
    final Map<String, dynamic> outerMessage = json.decode(message);
    if (outerMessage['data'] != null) {
      final Map<String, dynamic> parkingData = json.decode(outerMessage['data']);

      setState(() {
        // Check if spot is double-parked
        if (parkingData.containsKey('spot_id') && parkingData['spot_id'] == "check_db") {
          _fetchDoubleParkingData();
        } else if (parkingData.containsKey('spot_id') && parkingData['spot_id'] is String) {
          fetchParkingData();
          String spotId = parkingData['spot_id'];
          int isOccupied = parkingData['occupied'] == 'true' || parkingData['occupied'] == true ? 1 : 0;

          for (int i = 0; i < parkingSpots.length; i++) {
            if (parkingSpots[i]['id'].toString() == spotId) {
              parkingSpots[i]['occupied'] = isOccupied;
              break;
            }
          }
        }
      });
    }
  }

  Future<void> _fetchDoubleParkingData() async {
    try {
      final response = await http.get(
        Uri.parse('https://tarcar.multixers.cloud/api/parking/spot/' + fake_parked.toString()),
        headers: {
          'X-API-TOKEN': 'thisistokenandoidontwantautogenerate',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        if (responseData.containsKey('double_parked')) {
          List<dynamic> doubleParkedList = responseData['double_parked'];
          // If there is double parking, show a dialog
          if (doubleParkedList.isNotEmpty) {
            _showDoubleParkedDialog(doubleParkedList[0]);
          }
        }
      } else {
        throw Exception('Failed to load double parking data');
      }
    } catch (e) {
      print('Error during HTTP request: $e');
    }
  }

  // Show a dialog when double parking is detected
  void _showDoubleParkedDialog(dynamic doubleParked) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Double Parking Detected"),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('ID: ${doubleParked['id']}'),
              Text('Spot ID: ${doubleParked['parking_spot_id']}'),
              Text('Parked At: ${doubleParked['parked_at']}'),
              Text('Detected At: ${doubleParked['detected_at']}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  // Fetch parking spot data
  Future<void> fetchParkingData() async {
    try {
      final response = await http.get(
        Uri.parse('https://tarcar.multixers.cloud/api/all_parking_spots'),
        headers: {
          'X-API-TOKEN': 'thisistokenandoidontwantautogenerate',
        },
      );

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body)["parkingSpots"];
        setState(() {
          parkingSpots = data;
          // Check if fake_parked spot is occupied and show a dialog
          _checkFakeParkedStatus();
        });
      } else {
        throw Exception('Failed to load parking data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  // Check if fake_parked spot is occupied
  void _checkFakeParkedStatus() {
    for (var spot in parkingSpots) {
      if (spot['id'] == fake_parked) {
        if (spot['occupied'] == 1) {
          _showOccupiedSpotDialog(spot);
        }
        break;
      }
    }
  }

  // Show a dialog if the fake_parked spot is occupied
  void _showOccupiedSpotDialog(dynamic spot) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Spot Occupied"),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Your vehicle is parked at spot: ${spot['id']}'),
              Text('Area: ${spot['parking_area_id']}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _webSocketService.dispose(); // Close WebSocket connection
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TARCAR Parking'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: fetchParkingData,
              child: Text('Update Parking Data'),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: parkingSpots.map((spot) {
                    Color cardColor = spot['occupied'] == 1 ? Colors.red : Colors.teal;

                    return Card(
                      color: cardColor,
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Text('ID: ${spot['id']}'),
                            SizedBox(width: 20),
                            Text('Index: ${spot['index']}'),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}