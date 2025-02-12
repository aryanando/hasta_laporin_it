import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hasta_laporin_it/components/logout_confirmation_dialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            _buildHistorySection(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/header_fill.png'),
            fit: BoxFit.cover,
            opacity: 0.5),
        gradient: LinearGradient(
          colors: [Colors.blue.shade700, Colors.blue.shade400],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 5,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/pp.png'),
              ),
              Expanded(child: _buildSearchBar()),
              Container(
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: IconButton(
                  onPressed: () => {showAnimatedDialog(context)},
                  icon: Icon(
                    Icons.logout_rounded,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildCurrentReportCard(),
            ],
          ),
          SizedBox(height: 20),
          _buildActionButtons(),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Cari riwayat bantuan",
          hintStyle: TextStyle(color: Colors.white),
          border: InputBorder.none,
          icon: Icon(Icons.search, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildCurrentReportCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Status Laporan Anda", style: TextStyle(color: Colors.white)),
        Text(
          "Absen Error",
          style: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), color: Colors.yellow),
          child: Text(
            "On Proses",
            style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
          ),
        ),
        Text("Mohon Cek Secara Berkala",
            style: TextStyle(color: Colors.white70)),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.blue,
            shape: StadiumBorder(),
          ),
          child: Text("Laporan Baru"),
        )
      ],
    );
  }

  Widget _buildActionButtons() {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(64)),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 35,
        children: [
          _actionButton(Icons.thumb_up, "Like", Colors.blue),
          Container(width: 1, height: 50, color: Colors.grey),
          _actionButton(Icons.thumb_down, "Dislike", Colors.orange),
          Container(width: 1, height: 50, color: Colors.grey),
          _actionButton(Icons.coffee, "Support", Colors.amber),
        ],
      ),
    );
  }

  Widget _actionButton(IconData icon, String label, Color color) {
    return Column(
      children: [
        CircleAvatar(
            backgroundColor: color.withValues(alpha: 0.2),
            child: Icon(icon, color: color)),
        SizedBox(height: 5),
        Text(label, style: TextStyle(color: Colors.black87)),
      ],
    );
  }

  Widget _buildHistorySection() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Histori Laporan",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          dHistoryItem("Printer Error", "antrian", Colors.red, Icons.print),
          dHistoryItem("Absen error", "proses", Colors.orange, Icons.camera),
          dHistoryItem(
              "Internet Putus", "selesai", Colors.green, Icons.network_cell),
          dHistoryItem("Printer Error", "selesai", Colors.green, Icons.print),
        ],
      ),
    );
  }

  Widget dHistoryItem(String title, String amount, Color color, IconData icon) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(
            backgroundColor: color.withValues(alpha: 0.2),
            child: Icon(icon, color: color)),
        title: Text(title),
        trailing: Text(amount,
            style: TextStyle(color: color, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      currentIndex: 2,
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.blue), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.pie_chart), label: ""),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.qr_code_scanner,
              color: Colors.grey,
            ),
            label: ""),
        BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
      ],
    );
  }
}
