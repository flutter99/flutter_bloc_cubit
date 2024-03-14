import 'package:flutter/material.dart';
//import 'package:epub_view/epub_view.dart';
import 'package:vocsy_epub_viewer/epub_viewer.dart';

class EpubReaderPage extends StatefulWidget {
  const EpubReaderPage({super.key});

  @override
  State<EpubReaderPage> createState() => _EpubReaderPageState();
}

class _EpubReaderPageState extends State<EpubReaderPage> {
  // late EpubController _epubController;
  // bool _isAnimating = false;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   _epubController = EpubController(
  //     document: EpubDocument.openAsset('assets/book.epub'),
  //   );
  // }
  //
  // void _simulatePageTurn() {
  //   setState(() => _isAnimating = true);
  //   // Simulate a page turn with a delay
  //   Future.delayed(const Duration(milliseconds: 500), () {
  //     setState(() => _isAnimating = false);
  //     // This is where you'd increment or decrement the page index
  //     // _epubController.goto(EpubCfi);
  //   });
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text('EPUB Reader'),
  //     ),
  //     body: Stack(
  //       children: [
  //         EpubView(
  //           controller: _epubController,
  //           builders: EpubViewBuilders(options: ),
  //         ),
  //         if (_isAnimating)
  //           Container(
  //             color: Colors.white.withOpacity(0.8),
  //             child: const Center(
  //               child: Text(
  //                 'Turning Page...',
  //                 style: TextStyle(
  //                   fontSize: 24,
  //                   fontWeight: FontWeight.bold,
  //                 ),
  //               ),
  //             ),
  //           ),
  //       ],
  //     ),
  //     floatingActionButton: FloatingActionButton(
  //       onPressed: _simulatePageTurn,
  //       tooltip: 'Turn Page',
  //       child: const Icon(Icons.arrow_forward),
  //     ),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EPUB Reader'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => openEpubFile(context),
          child: const Text('Open EPUB File'),
        ),
      ),
    );
  }

  void openEpubFile(BuildContext context) async {
    String epubFilePath = 'assets/book.epub';
    try {
      VocsyEpub.setConfig(
        themeColor: Theme.of(context).primaryColor,
        identifier: "androidBook",
        scrollDirection: EpubScrollDirection.HORIZONTAL,
        allowSharing: true,
        enableTts: true,
      );
      // Open the EPUB file
      await VocsyEpub.openAsset(epubFilePath,
        // lastLocation: EpubLocator.fromJson({
        //   "bookId": "2239",
        //   "href": "/OEBPS/ch06.xhtml",
        //   "created": 1539934158390,
        //   "locations": {
        //     "cfi": "epubcfi(/0!/4/4[simple_book]/2/2/6)"
        //   }
        // }), // first page will open up if the value is null
      );
    } catch (e) {
      print("Error opening epub file: $e");
    }
  }

}
