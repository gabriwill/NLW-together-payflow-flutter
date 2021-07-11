import 'package:camera/camera.dart';

class BarCodeScannerStatus {
  final bool isCameraAvailable;
  final String erro;
  final String barCode;
  final bool stopScanner;

  BarCodeScannerStatus({
    this.isCameraAvailable = false,
    this.erro = "",
    this.stopScanner = false,
    this.barCode = "",
  });

  factory BarCodeScannerStatus.available() => BarCodeScannerStatus(
        isCameraAvailable: true,
        stopScanner: false,
      );

  factory BarCodeScannerStatus.erro(String msg) => BarCodeScannerStatus(
        erro: msg,
        stopScanner: true,
      );

  factory BarCodeScannerStatus.barcode(String barcode) => BarCodeScannerStatus(
        barCode: barcode,
        stopScanner: true,
      );

  bool get showCamera => isCameraAvailable && erro.isEmpty;
  bool get hasErro => erro.isNotEmpty;
  bool get hasBarcode => barCode.isNotEmpty;

  BarCodeScannerStatus copyWith({
    bool? isAvailable,
    String? error,
    String? barcode,
    bool? stopScanner,
    CameraController? cameraController,
  }) {
    return BarCodeScannerStatus(
      isCameraAvailable: isAvailable ?? this.isCameraAvailable,
      erro: error ?? this.erro,
      barCode: barcode ?? this.barCode,
      stopScanner: stopScanner ?? this.stopScanner,
    );
  }
}
