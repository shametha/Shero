class Journal{
  final String name,description,image;

  Journal(this.name, this.description, this.image,);

  static List<Journal> getList(){

    return [
      Journal("He Proposed!","The wait is finally over! Today was the best day of my life! It all seemed like a \nTaylor Swift song!","assets/images/journal_bg2.jpg",),
      Journal("My Birthday!","I had so much fun today.Mom arranged a surprise Party.Daddy couldn't come to the party today because he had to work late but I told him that I would save him a piece of cake.","assets/images/bg1.png",),
      Journal("Hate Day!","I feel so dejected. I feel like I am fit for nothing.My dreams are so big but the reality doesn't seem to cooperate.But I have faith in God. Destiny is always beautiful","./assets/images/3.png",),
      Journal("Just a Day","Today was just a day.Nothing much to say but I just save a kitten from drowning","./assets/images/4.png",),
      Journal("life's Colorful","I won the singing competition! I sang \"Shake It Off\"-by Taylor, and everybody was stunned.Even Tae loved it","./assets/images/bg5.png",),
    ];  }
}