import 'package:edge_detection/core/base_controller.dart';
import 'package:google_mlkit_document_scanner/google_mlkit_document_scanner.dart';
import 'package:edge_detection/utils/navigation_service.dart';
import '../utils/snacbar.dart';
import '../views/receipt_preview_screen.dart';

/// Controller for handling receipt scanning functionality.
/// 
/// This class extends `BaseController` to manage state and handle exceptions 
/// related to receipt scanning.
class ReceiptScannerController extends BaseController {
  /// Instance of `DocumentScanner` for handling scanning operations.
  DocumentScanner? _documentScanner;

  /// Initiates the document scanning process.
  /// 
  /// - If no document is scanned, a snackbar notification is shown.
  /// - If a document is scanned, navigates to `ReceiptPreviewScreen` with the scanned images.
  Future<void> scan({DocumentScannerOptions? docsOptions}) async {
    try {
      _documentScanner = DocumentScanner(
        options: docsOptions ?? DocumentScannerOptions(
          documentFormat: DocumentFormat.jpeg, // Output format set to JPEG.
          mode: ScannerMode.filter, // Enables specific scanner features.
          pageLimit: 1, // Limits scanning to a single page.
          isGalleryImport: false, // Disables importing from the gallery.
        ),
      );
      
      DocumentScanningResult? result = await _documentScanner?.scanDocument();
      final images = result?.images; // List containing scanned image paths.
      
      if (images == null || images.isEmpty) {
        showSnacBar(msg: "No receipt document is scanned.");
      } else {
        ReceiptPreviewScreen(documents: images).push(); // Navigate to preview screen.
      }
    } catch (e) {
      setException = e; // Handle exceptions.
    }
  }

  /// Cleans up resources by closing the document scanner instance.
  void dispose() {
    _documentScanner?.close();
  }
}
