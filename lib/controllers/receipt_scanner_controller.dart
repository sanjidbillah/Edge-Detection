import 'package:edge_detection/core/base_controller.dart';
import 'package:google_mlkit_document_scanner/google_mlkit_document_scanner.dart';
import 'package:edge_detection/utils/navigation_service.dart';
import '../utils/snacbar.dart';
import '../views/receipt_preview_screen.dart';

/// Controller class for handling receipt scanning functionality.
/// Extends `BaseController` to manage state and handle exceptions.
class ReceiptScannerController extends BaseController {
  /// Configures document scanner options.
  /// - Uses JPEG format.
  /// - Scans in full mode.
  /// - Limits to 1 page.
  /// - Allows importing from the gallery.
  final DocumentScannerOptions _documentOptions = DocumentScannerOptions(
    documentFormat: DocumentFormat.jpeg,
    mode: ScannerMode.full,
    pageLimit: 1,
    isGalleryImport: false,
  );

  /// Creates a document scanner instance with the specified options.
  late final _documentScanner = DocumentScanner(options: _documentOptions);

  /// Initiates the document scanning process.
  /// - If no document is scanned, shows a snackbar notification.
  /// - If a document is scanned, navigates to `ReceiptPreviewScreen` with the scanned images.
  Future<void> scan() async {
    try {
      // Start document scanning
      DocumentScanningResult result = await _documentScanner.scanDocument();

      final images = result.images;

      // Show a message if no document is scanned
      if (images.isEmpty) {
        showSnacBar(msg: "No receipt document is scanned.");
      } else {
        // Navigate to the preview screen with scanned documents
        ReceiptPreviewScreen(
          documents: images,
        ).push();
      }
    } catch (e) {
      // Handle any exceptions by setting the error in the controller
      setException = e;
    }
  }

  /// Cleans up resources by closing the document scanner.
  void dispose() {
    _documentScanner.close();
  }
}
