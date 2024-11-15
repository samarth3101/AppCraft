import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:file_picker/file_picker.dart'; // For file selection
import 'package:permission_handler/permission_handler.dart'; // For permission handling

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  CameraController? _cameraController;
  List<CameraDescription>? _cameras;
  bool _isCameraInitialized = false;
  bool _isScanning = false;

  @override
  void initState() {
    super.initState();
    _requestPermissions(); // Request permissions when the page is initialized
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  Future<void> _requestPermissions() async {
    // Request camera and storage permissions
    PermissionStatus cameraStatus = await Permission.camera.request();
    PermissionStatus storageStatus = await Permission.storage.request();

    if (cameraStatus.isGranted && storageStatus.isGranted) {
      // If permissions are granted, initialize the camera
      _initializeCamera();
    } else {
      // If permissions are denied, show a message or handle it accordingly
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Camera and storage permissions are required')),
      );
    }
  }

  Future<void> _initializeCamera() async {
    _cameras = await availableCameras();
    if (_cameras != null && _cameras!.isNotEmpty) {
      _cameraController = CameraController(
        _cameras![0],
        ResolutionPreset.high,
      );

      await _cameraController!.initialize();
      setState(() {
        _isCameraInitialized = true;
      });
    }
  }

  void _startScanning() {
    setState(() {
      _isScanning = true;
    });

    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _isScanning = false;
      });
      _showScanResult();
    });
  }

  void _showScanResult() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Scan Complete'),
          content: const Text('The document has been scanned successfully!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _uploadDocument() async {
    // Pick a file from the user's device
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    
    if (result != null) {
      // File selected successfully
      final filePath = result.files.single.path;
      if (filePath != null) {
        // Here you can handle the uploaded file (e.g., send it to the server)
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Document uploaded from: $filePath')),
        );
      }
    } else {
      // User canceled the picker
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No file selected')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          if (_isCameraInitialized) CameraPreview(_cameraController!),
          if (_isScanning)
            Positioned(
              top: MediaQuery.of(context).size.height / 4,
              left: MediaQuery.of(context).size.width / 4,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue, width: 4),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Scan your document',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _isScanning ? null : _startScanning,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                  child: Text(_isScanning ? 'Scanning...' : 'Start Scanning'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _uploadDocument,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                  child: const Text('Upload Document'),
                ),
              ],
            ),
          ),
          if (!_isScanning)
            Container(
              color: Colors.black.withOpacity(0.3),
            ),
        ],
      ),
    );
  }
}