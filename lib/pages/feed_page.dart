import 'package:flutter/material.dart';
import 'package:instagram/models/post_madel.dart';
import 'package:instagram/models/story_model.dart';
class FeedPage extends StatefulWidget {
  const FeedPage({ Key? key }) : super(key: key);
  static const String id  = "FeedPage";

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {

  List<Story> stories = [
    Story("assets/images/user_1.jpeg", "Lolo Pepe"),
    Story("assets/images/user_2.jpeg", "Lolo Pepe"),
    Story("assets/images/user_3.jpeg", "Lolo Pepe"),
    Story("assets/images/user_4.jpeg", "Lolo Pepe"),
    Story("assets/images/user_5.jpeg", "Lolo Pepe"),
  ];

  List<Post> posts = [
    Post(
      "Lolo", 
      "assets/images/user_1.jpeg", 
      "assets/images/feed_1.jpeg", 
      "Lolo pepe lolo pepe lolo pepe"
    ),
     Post(
      "Pepe", 
      "assets/images/user_5.jpeg", 
      "assets/images/feed_21.jpeg", 
      "Lolo pepe lolo pepe lolo pepe"
    ),
    Post(
      "Pepe", 
      "assets/images/user_2.jpeg", 
      "assets/images/feed_2.jpeg", 
      "Lolo pepe lolo pepe lolo pepe"
    ),
    Post(
      "Kakku", 
      "assets/images/user_3.jpeg", 
      "assets/images/feed_3.jpeg", 
      "Lolo pepe lolo pepe lolo pepe"
    ),
    Post(
      "Lolo", 
      "assets/images/user_4.jpeg", 
      "assets/images/feed_4.jpeg", 
      "Lolo pepe lolo pepe lolo pepe"
    ),
    Post(
      "Pepe", 
      "assets/images/user_5.jpeg", 
      "assets/images/feed_5.jpeg", 
      "Lolo pepe lolo pepe lolo pepe"
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children:[
              Divider(),
              // stories
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Text("Stories", style: TextStyle(color: Colors.grey, fontSize: 14),),
                    Text("Watch All", style: TextStyle(color: Colors.grey, fontSize: 14)),
                  ],
                ),
              ),

              // Story list
              Container(
                width:MediaQuery.of(context).size.width,
                margin:EdgeInsets.symmetric(vertical: 10),
                height: 110,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: stories.map((story){
                    return itemofStory(story);
                  }).toList(),
                ),
              ),

              // post

              Container(
                width:MediaQuery.of(context).size.width,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: posts.length,
                  itemBuilder: (context, i){
                    return itemOfPost(posts[i]);
                  },
                ),
              )

            ]
          ),
        ),
      ),
    );
  }
 Widget itemofStory(story){
    return Column(
      children: [
        Container(
          margin:EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(70),
            border:Border.all(
              width: 3,
              color: Color(0xFF8e44ad),
            )   
          ),
          child:Container(
            padding: EdgeInsets.all(2),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(70),
              child: Image(
                image: AssetImage(story.image),
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
          )
        ),
        SizedBox(height: 10,),
        Text(story.name),
      ],
    );
  }

  Widget itemOfPost(Post post){
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          // header
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image(
                        image: AssetImage(post.userImage),
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 10,),
                    Text(post.userName, style: TextStyle(color:Colors.black),)
                  ],
                ),

                IconButton(
                  icon: Icon(Icons.keyboard_control),
                  onPressed: () {
                    
                  },
                )
              ],
            ),
          ),

          // Image
          FadeInImage(
            image: AssetImage(post.postImage),
            placeholder: AssetImage("assets/images/placeholder.png"), 
            width:MediaQuery.of(context).size.width,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    icon:Icon(Icons.favorite_outline_rounded),
                    onPressed: () {
                    },
                  ),
                  IconButton(
                    icon:Icon(Icons.comment_outlined),
                    onPressed: () {
                    },
                  ),
                  IconButton(
                    icon:Icon(Icons.send_rounded),
                    onPressed: () {
                    },
                  )
                ],
              ),
              IconButton(
                icon:Icon(Icons.bookmark_border),
                onPressed: () {
                },
              )

            ],
          ),

          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal:14),
            child:RichText(
              softWrap: true,
              overflow: TextOverflow.visible,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Liked By ",
                    style: TextStyle(color: Colors.black)
                  ),
                  TextSpan(
                    text: "Bobur, ",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)
                  ),
                  TextSpan(
                    text: "Shamshod, ",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)
                  ),
                  TextSpan(
                    text: "Guli ",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)
                  ),
                  TextSpan(
                    text: "and ",
                    style: TextStyle(color: Colors.black)
                  ),
                  TextSpan(
                    text: "1225 others",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)
                  ),
                ]
              ),
            ),
          ),

          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal:14, vertical: 5),
            child: RichText(
              softWrap: true,
              overflow: TextOverflow.visible,
              text:TextSpan(
                children:[
                  TextSpan(
                    text: post.userName+' ',
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)
                  ),
                   TextSpan(
                    text: post.caption,
                    style: TextStyle(color: Colors.black)
                  ),
                ]
              )
            ),
          ),

          Container(
            margin: EdgeInsets.symmetric(horizontal:14, vertical: 5),
            alignment: Alignment.topLeft,
            child: Text("Febuary 2021", style: TextStyle(color:Colors.grey),),
          )


        ],
      ),
    );
  }
}