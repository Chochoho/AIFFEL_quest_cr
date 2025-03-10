import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MusicPlayerScreen(),
    );
  }
}

class MusicPlayerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          // 상단 제목 바
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("노래", style: TextStyle(color: Colors.white, fontSize: 18)),
                  Text("동영상", style: TextStyle(color: Colors.white54, fontSize: 18)),
                  Icon(Icons.cast, color: Colors.white),
                ],
              ),
            ),
          ),

          // 앨범 커버 이미지 & 제목
          Stack(
            children: [
              Image.asset(
                'images/coffee.jpg',
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 10,
                left: 16,
                child: Text(
                  "Work & Study Jazz",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),

          // Playlist 제목
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("[Playlist] 일하면서 틀어 놓기",
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 5),
                Text("WRG 우리가 듣고 싶어서 연주한 playlist",
                    style: TextStyle(color: Colors.white54, fontSize: 14)),
              ],
            ),
          ),

          // 좋아요, 댓글, 저장, 공유 버튼
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              iconButton(Icons.thumb_up, "5천"),
              iconButton(Icons.comment, "86"),
              iconButton(Icons.playlist_add, "저장"),
              iconButton(Icons.share, "공유"),
            ],
          ),

          // 음악 진행 바
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("11:01", style: TextStyle(color: Colors.white54)),
                Expanded(
                  child: Slider(
                    value: 11.01,
                    min: 0,
                    max: 487.11,
                    onChanged: (value) {},
                    activeColor: Colors.white,
                    inactiveColor: Colors.white24,
                  ),
                ),
                Text("8:07:11", style: TextStyle(color: Colors.white54)),
              ],
            ),
          ),

          // 재생 컨트롤러
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(icon: Icon(Icons.shuffle, color: Colors.white54), onPressed: () {}),
              IconButton(icon: Icon(Icons.skip_previous, color: Colors.white), onPressed: () {}),
              FloatingActionButton(
                backgroundColor: Colors.white,
                child: Icon(Icons.pause, color: Colors.black),
                onPressed: () {},
              ),
              IconButton(icon: Icon(Icons.skip_next, color: Colors.white), onPressed: () {}),
              IconButton(icon: Icon(Icons.repeat, color: Colors.white54), onPressed: () {}),
            ],
          ),

          // 하단 메뉴 (다음 트랙, 가사, 관련 항목)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NextTrackScreen()),
                    );
                  },
                  child: Text("다음 트랙", style: TextStyle(color: Colors.white54, fontSize: 16)),
                ),
                Text("가사", style: TextStyle(color: Colors.white54, fontSize: 16)),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RelatedItemsScreen()),
                    );
                  },
                  child: Text("관련 항목", style: TextStyle(color: Colors.white54, fontSize: 16)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NextTrackScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("재생중인 트랙", style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Text("재생중인 트랙 화면", style: TextStyle(color: Colors.white, fontSize: 18)),
      ),
    );
  }
}

class RelatedItemsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("관련 항목", style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Text("관련 항목 화면", style: TextStyle(color: Colors.white, fontSize: 18)),
      ),
    );
  }
}

Widget iconButton(IconData icon, String label) {
  return Column(
    children: [
      Icon(icon, color: Colors.white),
      SizedBox(height: 4),
      Text(label, style: TextStyle(color: Colors.white54)),
    ],
  );
}