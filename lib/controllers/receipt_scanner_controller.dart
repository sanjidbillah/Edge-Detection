import 'package:edge_detection/core/base_controller.dart';
import 'package:google_mlkit_document_scanner/google_mlkit_document_scanner.dart';
import 'package:edge_detection/utils/navigation_service.dart';
import '../utils/snacbar.dart';
import '../views/receipt_preview_screen.dart';

class ReceiptScannerController extends BaseController {
  final DocumentScannerOptions _documentOptions = DocumentScannerOptions(
    documentFormat: DocumentFormat.jpeg,
    mode: ScannerMode.base,
    pageLimit: 1,
    isGalleryImport: true,
  );

  late final _documentScanner = DocumentScanner(options: _documentOptions);

  scan() async {
    try {
      DocumentScanningResult result = await _documentScanner.scanDocument();

      final images = result.images;
      if (images.isEmpty) {
        showSnacBar(msg: "No receipt document is scanned.");
      } else {
        ReceiptPreviewScreen(
          documents: images,
        ).push();
      }
    } catch (e) {
      setException = e;
    }
  }

  dispose() {
    _documentScanner.close();
  }
}
