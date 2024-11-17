import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class DepositPage extends StatefulWidget {
  const DepositPage({super.key});

  @override
  _DepositPageState createState() => _DepositPageState();
}

class _DepositPageState extends State<DepositPage> {
  CameraController? _cameraController;
  List<CameraDescription>? cameras;
  bool _isCameraInitialized = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    try {
      cameras = await availableCameras();
      if (cameras != null && cameras!.isNotEmpty) {
        _cameraController = CameraController(
          cameras![0],
          ResolutionPreset.high,
        );

        await _cameraController!.initialize();
        setState(() {
          _isCameraInitialized = true;
        });
      } else {
        setState(() {
          _errorMessage = 'No cameras found on this device.';
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Error initializing camera: $e';
      });
      print('Error initializing camera: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Deposit Checks',
          style: TextStyle(
            fontFamily: 'Cursive',
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.indigoAccent,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 165, 206, 243),
              Color.fromARGB(255, 85, 135, 210),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            if (_errorMessage != null)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  _errorMessage!,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            else if (_isCameraInitialized && _cameraController != null)
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CameraPreview(_cameraController!),
                ),
              )
            else
              const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton.icon(
                onPressed: () async {
                  if (_cameraController != null &&
                      _cameraController!.value.isInitialized) {
                    try {
                      final image = await _cameraController!.takePicture();
                      print('Image captured: ${image.path}');
                      // Add image processing logic here
                    } catch (e) {
                      print('Error capturing image: $e');
                    }
                  } else {
                    print('Camera is not initialized');
                  }
                },
                icon: const Icon(Icons.camera, color: Colors.white),
                label: const Text(
                  'Capture and Process Check',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigoAccent,
                  padding:
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 28),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 10,
                  shadowColor: Colors.black26,
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Ensure your check is fully visible within the frame.',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }
}
