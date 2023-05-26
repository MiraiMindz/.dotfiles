const quotes = [
    {
        "text": "The world isn't perfect. But it's there for us, doing the best it can....that's what makes it so damn beautiful.",
        "author": "Roy Mustang",
        "show": "Full Metal Alchemist"
    },
    {
        "text": "To know sorrow is not terrifying. What is terrifying is to know you can't go back to happiness you could have.",
        "author": "Matsumoto Rangiku",
        "show": "Bleach"
    },
    {
        "text": "We are all like fireworks: we climb, we shine and always go our separate ways and become further apart. But even when that time comes, let's not disappear like a firework and continue to shine.. forever.",
        "author": "Hitsugaya Toshiro",
        "show": "Bleach"
    },
    {
        "text": "Those who stand at the top determine what's wrong and what's right! This very place is neutral ground! Justice will prevail, you say? But of course it will! Whoever wins this war becomes justice!",
        "author": "Don Quixote Doflamingo ",
        "show": "One Piece"
    },
    {
        "text": "Fear is not evil. It tells you what weakness is. And once you know your weakness, you can become stronger as well as kinder.",
        "author": "Gildarts Clive",
        "show": "Fairy Tail"
    },
    {
        "text": "Whatever you lose, you'll find it again. But what you throw away you'll never get back.",
        "author": "Kenshin Himura",
        "show": "Rurouni Kenshin: Meiji Kenkaku Romantan"
    },
    {
        "text": "Fear is freedom! Subjugation is liberation! Contradiction is truth! Those are the facts of this world! And you will all surrender to them, you pigs in human clothing!",
        "author": "Satsuki Kiryuuin",
        "show": "Kill la Kill"
    },
    {
        "text": "I am the hope of the universe. I am the answer to all living things that cry out for peace. I am protector of the innocent. I am the light in the darkness. I am truth. Ally to good! Nightmare to you!",
        "author": "Son Goku",
        "show": "Dragon Ball Z"
    },
    {
        "text": "Religion, ideology, resources, land, spite, love or just because… No matter how pathetic the reason, it’s enough to start war. War will never cease to exist… reasons can be thought up after the fact… Human nature pursues strife.",
        "author": "Pain",
        "show": "Naruto Shippuden"
    },
    {
        "text": "People, who can’t throw something important away, can never hope to change anything.",
        "author": "Armin Arlert",
        "show": "Shingeki no Kyojin"
    },
    {
        "text": "I want you to be happy. I want you to laugh a lot. I don’t know what exactly I’ll be able to do for you, but I’ll always be by your side.",
        "author": "Kagome",
        "show": "InuYasha"
    },
    {
        "text": "Thinking you’re no-good and worthless is the worst thing you can do",
        "author": "Nobito",
        "show": "Doraemon"
    },
    {
        "text": "Don’t give up, there’s no shame in falling down! True shame is to not stand up again!",
        "author": "Shintaro Midorima",
        "show": "Kuroko No Basket"
    },
    {
        "text": "People’s lives don’t end when they die, it ends when they lose faith.",
        "author": "Itachi Uchiha",
        "show": "Naruto"
    },
    {
        "text": "If you don’t take risks, you can’t create a future!",
        "author": "Monkey D. Luffy",
        "show": "One Piece"
    },
    {
        "text": "If you don’t like your destiny, don’t accept it.",
        "author": "Naruto Uzumaki",
        "show": "Naruto"
    },
    {
        "text": "When you give up, that’s when the game ends.",
        "author": "Mitsuyoshi Anzai",
        "show": "Slam Dunk"
    },
    {
        "text": "All we can do is live until the day we die. Control what we can…and fly free.",
        "author": "Deneil Young",
        "show": "Uchuu Kyoudai or Space Brothers"
    },
    {
        "text": "Forgetting is like a wound. The wound may heal, but it has already left a scar.",
        "author": "Monkey D. Luffy",
        "show": "One Piece"
    },
    {
        "text": "It’s just pathetic to give up on something before you even give it a shot.",
        "author": "Reiko Mikami",
        "show": "Another"
    },
    {
        "text": "If you don’t share someone’s pain, you can never understand them.",
        "author": "Nagato",
        "show": "Naruto"
    },
    {
        "text": "Whatever you lose, you’ll find it again. But what you throw away you’ll never get back.",
        "author": "Himura Kenshin",
        "show": "Rurouni Kenshin"
    },
    {
        "text": "We don’t have to know what tomorrow holds! That’s why we can live for everything we’re worth today!",
        "author": "Natsu Dragneel",
        "show": "Fairy Tai"
    },
    {
        "text": "Why should I apologize for being a monster? Has anyone ever apologized for turning me into one?",
        "author": "Juuzou Suzuya",
        "show": "Tokyo Ghoul"
    },
    {
        "text": "People become stronger because they have memories they can’t forget.",
        "author": "Tsunade",
        "show": "Naruto"
    },
    {
        "text": "I’ll leave tomorrow’s problems to tomorrow’s me.",
        "author": "Saitama",
        "show": "One-Punch Man"
    },
    {
        "text": "If you wanna make people dream, you’ve gotta start by believing in that dream yourself!",
        "author": "Seiya Kanie",
        "show": "Amagi Brilliant Park"
    },
    {
        "text": "Being lonely is more painful then getting hurt.",
        "author": "Monkey D. Luffy",
        "show": "One Piece"
    },
    {
        "text": "There’s no shame in falling down! True shame is to not stand up again!",
        "author": "Shintarō Midorima",
        "show": "Kuroko’s Basketball"
    },
    {
        "text": "Simplicity is the easiest path to true beauty.",
        "author": "Seishuu Handa",
        "show": "Barakamon"
    },
    {
        "text": "If you can’t do something, then don’t. Focus on what you can.",
        "author": "Shiroe",
        "show": "Log Horizon"
    },
    {
        "text": "Giving up kills people. When people reject giving up… they finally win the right to transcend humanity.",
        "author": "Alucard",
        "show": "Hellsing"
    },
    {
        "text": "You can die anytime, but living takes true courage.",
        "author": "Kenshin Himura",
        "show": "Rurouni Kenshin"
    },
    {
        "text": "Every journey begins with a single step. We just have to have patience.",
        "author": "Milly Thompson",
        "show": "Trigun"
    },
    {
        "text": "It doesn’t do any good to pretend you can’t see what’s going on.",
        "author": "Yuuya Mochizuki",
        "show": "Another"
    },
    {
        "text": "Being weak is nothing to be ashamed of… Staying weak is !!",
        "author": "Fuegoleon Vermillion",
        "show": "Black Clover"
    },
    {
        "text": "To act is not necessarily compassion. True compassion sometimes comes from inaction.",
        "author": "Hinata Miyake",
        "show": "A Place Further than the Universe"
    },
    {
        "text": "A dropout will beat a genius through hard work.",
        "author": "Rock Lee",
        "show": "Naruto"
    },
    {
        "text": "Reject common sense to make the impossible possible.",
        "author": "Simon",
        "show": "Tengen Toppa Gurren Lagann"
    },
    {
        "text": "Whatever you lose, you’ll find it again. But what you throw away you’ll never get back.",
        "author": "Kenshin Himura",
        "show": "Rurouni Kenshin"
    },
    {
        "text": "If you really want to be strong… Stop caring about what your surrounding thinks of you!",
        "author": "Saitama",
        "show": "One Punch Man"
    },
    {
        "text": "Vision is not what your eyes see, but an image that your brain comprehends.",
        "author": "Touko Aozaki",
        "show": "Kara no Kyōkai"
    },
    {
        "text": "Sometimes, people are just mean. Don’t fight mean with mean. Hold your head high.",
        "author": "Hinata Miyake",
        "show": "A Place Further than the Universe"
    },
    {
        "text": "The ticket to the future is always open.",
        "author": "Vash The Stampede",
        "show": "Trigun"
    },
    {
        "text": "Hard work is worthless for those that don’t believe in themselves.",
        "author": "Naruto Uzumaki",
        "show": "Naruto"
    },
    {
        "text": "A place where someone still thinks about you is a place you can call home.",
        "author": "Jiraiya",
        "show": "Naruto"
    },
    {
        "text": "Life comes at a cost. Wouldn’t it be arrogant to die before you’ve repaid that debt?",
        "author": "Yuuji Kazami",
        "show": "Gurizaia no Kajitsu"
    },
    {
        "text": "You can die anytime, but living takes true courage.",
        "author": "Himura Kenshin",
        "show": "Rurouni Kenshin"
    },
    {
        "text": "Every journey begins with a single step. We just have to have patience.",
        "author": "Milly Thompson",
        "show": "Trigun"
    },
    {
        "text": "If you just submit yourself to fate, then that’s the end of it.",
        "author": "Keiichi Maebara",
        "show": "Higurashi: When They Cry"
    },
    {
        "text": "It is at the moment of death that humanity has value.",
        "author": "Archer",
        "show": "Fate Series"
    },
    {
        "text": "People, who can’t throw something important away, can never hope to change anything.",
        "author": "Armin Arlert",
        "show": "Shingeki no Kyojin"
    },
    {
        "text": "Whatever you do, enjoy it to the fullest. That is the secret of life.",
        "author": "Rider",
        "show": "Fate Zero"
    },
    {
        "text": "Power comes in response to a need, not a desire. You have to create that need.",
        "author": "Goku",
        "show": "Dragon Ball Z"
    },
    {
        "text": "There are no regrets. If one can be proud of one’s life, one should not wish for another chance.",
        "author": "Saber",
        "show": "Fate Stay Night"
    },
    {
        "text": "You can’t always hold on to the things that are important. By letting them go we gain something else.",
        "author": "Kunio Yaobi",
        "show": "Tamako Market"
    },
    {
        "text": "If you don’t like your destiny, don’t accept it. Instead, have the courage to change it the way you want it to be.",
        "author": "Naruto Uzumaki",
        "show": "Naruto"
    },
    {
        "text": "Don’t beg for things. Do it yourself, or else you won’t get anything.",
        "author": "Renton Thurston",
        "show": "Eureka Seven"
    },
    {
        "text": "I refuse to let my fear control me anymore.",
        "author": "Maka Albarn",
        "show": "Soul Eater"
    },
    {
        "text": "If you can’t find a reason to fight, then you shouldn’t be fighting.",
        "author": "Akame",
        "show": "Akame Ga Kill"
    },
    {
        "text": "You should never give up on life, no matter how you feel. No matter how badly you want to give up.",
        "author": "Canaan",
        "show": "Canaan"
    },
    {
        "text": "People who can’t throw something important away, can never hope to change anything.",
        "author": "Armin Arlelt",
        "show": "Shingeki no Kyojin"
    },
    {
        "text": "We can’t waste time worrying about the what if’s.",
        "author": "Ichigo Kurosaki",
        "show": "Bleach"
    },
    {
        "text": "Fools who don’t respect the past are likely to repeat it.",
        "author": "Nico Robin",
        "show": "One Piece"
    },
    {
        "text": "That’s why I can’t make a change. Everything I do is so… Half-assed.",
        "author": "Hiroshi Kido",
        "show": "Barakamon"
    },
    {
        "text": "Sometimes it’s necessary to do unnecessary things.",
        "author": "Kanade Jinguuji",
        "show": "Best Student Council"
    },
    {
        "text": "An excellent leader must be passionate because it’s their duty to keep everyone moving forward.",
        "author": "Love Live",
        "show": "Nico Yazawa"
    },
    {
        "text": "Protecting someone means giving them a place to belong. Giving them a place where they can be happy.",
        "author": "Princess Lenessia",
        "show": "Log Horizon"
    },
    {
        "text": "Thinking you’re no-good and worthless is the worst thing you can do",
        "author": "Nobito",
        "show": "Doraemon"
    },
    {
        "text": "Sometimes I do feel like I’m a failure. Like there’s no hope for me. But even so, I’m not gonna give up. Ever!",
        "author": "Izuku Midoriya",
        "show": "My Hero Academia"
    },
    {
        "text": "If you can’t do something, then don’t. Focus on what you can do.",
        "author": "Shiroe",
        "show": "Log Horizon"
    },
    {
        "text": "When you lose sight of your path, listen for the destination in your heart.",
        "author": "Allen Walker",
        "show": "D.Gray Man"
    },
    {
        "text": "The moment you think of giving up, think of the reason why you held on so long.",
        "author": "Natsu Dragneel",
        "show": "Fairy Tail"
    },
    {
        "text": "Don’t give up, there’s no shame in falling down! True shame is to not stand up again!",
        "author": "Shintaro Midorima",
        "show": "Kuroko No Basket"
    },
    {
        "text": "No matter how hard or impossible it is, never lose sight of your goal.",
        "author": "Monkey D Luffy",
        "show": "One Piece"
    },
    {
        "text": "Life is not a game of luck. If you wanna win, work hard.",
        "author": "Sora",
        "show": "No Game No Life"
    },
    {
        "text": "Fear is not evil. It tells you what your weakness is. And once you know your weakness, you can become stronger as well as kinder.",
        "author": "Gildarts Clive",
        "show": "Fairy Tail"
    },
    {
        "text": "To know sorrow is not terrifying. What is terrifying is to know you can’t go back to happiness you could have.",
        "author": "Matsumoto Rangiku",
        "show": "Bleach"
    },
    {
        "text": "Knowing you’re different is only the beginning. If you accept these differences you’ll be able to get past them and grow even closer.",
        "author": "Miss Kobayashi",
        "show": "Dragon Maid"
    },
    {
        "text": "Don’t be so quick to throw away your life. No matter how disgraceful or embarrassing it may be, you need to keep struggling to find your way out until the very end.",
        "author": "Clare",
        "show": "Claymore"
    },
    {
        "text": "We are all like fireworks: we climb, we shine and always go our separate ways and become further apart. But even when that time comes, let’s not disappear like a firework and continue to shine.. forever.",
        "author": "Hitsugaya Toshiro",
        "show": "Bleach"
    },
    {
        "text": "If nobody cares to accept you and wants you in this world, accept yourself and you will see that you don’t need them and their selfish ideas.",
        "author": "Alibaba Saluja",
        "show": "Magi"
    },
    {
        "text": "When you hit the point of no return, that’s the moment it truly becomes a journey. If you can still turn back, it’s not really a journey.",
        "author": "Hinata Miyake",
        "show": "A Place Further than the Universe"
    },
    {
        "text": "Those who stand at the top determine what’s wrong and what’s right! This very place is neutral ground! Justice will prevail, you say? But of course it will! Whoever wins this war becomes justice!",
        "author": "Don Quixote Doflamingo",
        "show": "One Piece"
    },
    {
        "text": "A person grows up when he’s able to overcome hardships. Protection is important, but there are some things that a person must learn on his own.",
        "author": "Jiraiya",
        "show": "Naruto"
    },
    {
        "text": "Who decides limits? And based on what? You said you worked hard? Well, maybe you need to work a little harder. Is that really the limit of your strength? Could you of tomorrow beat you today? Instead of giving in, move forward.",
        "author": "Saitama",
        "show": "One Punch Man"
    },
    {
        "text": "Mistakes are not shackles that halt one from stepping forward. Rather, they are that which sustain and grow one’s heart.",
        "author": "Mavis Vermillion",
        "show": "Fairy Tail"
    },
    {
        "text": "Fear is freedom! Subjugation is liberation! Contradiction is the truth! Those are the facts of this world! And you will all surrender to them, you pigs in human clothing!",
        "author": "Satsuki Kiryuuin",
        "show": "Kill la Kill"
    },
    {
        "text": "Hatred and Sorrow are power. They are yours to control. All you have to do is to turn them into strength and use that strength to move forward.",
        "author": "Sebastian Michaelis",
        "show": "Kuroshitsuji"
    },
    {
        "text": "It’s not always possible to do what we want to do, but it’s important to believe in something before you actually do it.",
        "author": "Might Guy",
        "show": "Naruto"
    },
    {
        "text": "Life and death are like light and shadow. They’re both always there. But people don’t like thinking about death, so subconsciously, they always look away from it.",
        "author": "Yato",
        "show": "Noragami"
    },
    {
        "text": "It’s more important to master the cards you’re holding than to complain about the ones your opponent was dealt.",
        "author": "Grimsley",
        "show": "Pokemon"
    },
    {
        "text": "I am the hope of the universe. I am the answer to all living things that cry out for peace. I am the protector of the innocent. I am the light in the darkness. I am the truth. Ally to good! Nightmare to you!",
        "author": "Son Goku",
        "show": "Dragon Ball Z"
    },
    {
        "text": "If you’re gonna insist on gambling and then complain when you lose, you had better work on your game.",
        "author": "Hatsu Kominato",
        "show": "Selector Infected Wixoss"
    },
    {
        "text": "Moving on doesn’t mean you forget about things. It just means you have to accept what’s happened and continue living.",
        "author": "Erza Scarlet",
        "show": "Fairy Tail"
    },
    {
        "text": "If nobody cares to accept you and wants you in this world, accept yourself and you will see that you don’t need them and their selfish ideas.",
        "author": "Alibaba Saluja",
        "show": "Universal Warriors"
    },
    {
        "text": "If you keep on hiding your true feelings, who is going to be happy? If you are sad, you should say it out loud!",
        "author": "Haruhi Fujioka",
        "show": "Ouran High School Host Club"
    },
    {
        "text": "Religion, ideology, resources, land, spite, love or just because… No matter how pathetic the reason, it’s enough to start a war. War will never cease to exist… reasons can be thought up after the fact… Human nature pursues strife.",
        "author": "Pain",
        "show": "Naruto Shippuden"
    },
    {
        "text": "Don’t be upset because of what you can’t do. Do what you do best, live as carefree and optimistically as you can, because some people aren’t able to do that.",
        "author": "Keima Katsuragi",
        "show": "The World God Only Knows"
    },
    {
        "text": "If you begin to regret, you’ll dull your future decisions and let others make your choices for you. All that’s left for you then is to die. Nobody can foretell the outcome. Each decision you make holds meaning only by affecting your next decision.",
        "author": "Erwin Smith",
        "show": "Shingeki no Kyojin"
    },
    {
        "text": "Everything has a beginning and an end. Life is just a cycle of starts and stops. There are ends we don’t desire, but they’re inevitable, we have to face them. It’s what being human is all about.",
        "author": "Jet Black",
        "show": "Cowboy Bebop"
    },
    {
        "text": "Anything can happen. No one ever thinks it will until it does. What will happen, happens. That’s how the world is. The most important thing is to not let the tragedy defeat you. To believe that you can get through it.",
        "author": "Kyousuke Natsume",
        "show": "Little Busters!"
    },
    {
        "text": "You’ll only realize that you truly love someone if they already caused you enormous pain. Your enemies can never hurt you the way your loved ones can. It’s the people close to your heart that can give you the most piercing wound. Love is a double-edged sword, it can heal the wound faster or it can sink the blade even deeper.",
        "author": "Himura Kenshin",
        "show": "Rurouni Kenshin"
    },
    {
        "text": "I want you to be happy. I want you to laugh a lot. I don’t know what exactly I’ll be able to do for you, but I’ll always be by your side.",
        "author": "Kagome",
        "show": "InuYasha"
    },
    {
        "text": "A lesson without pain is meaningless. That’s because no one can gain without sacrificing something. But by enduring that pain and overcoming it, he shall obtain a powerful, unmatched heart.",
        "author": "Edward Elric",
        "show": "Fullmetal Alchemist"
    },
    {
        "text": "You need to accept the fact that you’re not the best and have all the will to strive to be better than anyone you face.",
        "author": "Roronoa Zoro",
        "show": "One Piece"
    },
    {
        "text": "I too will obtain everything that I desire. Not because someone asked me to do it, but because I know in my heart that I have something worth fighting for.",
        "author": "Julis Alexia Van Riessfeld",
        "show": "Asterisk War"
    },
    {
        "text": "You can’t win a game by doing nothing. And if someone else wins it for you then you haven’t accomplished anything. Life is the same way.",
        "author": "Junichirou Kagami",
        "show": "Denpa Kyoushi"
    },
    {
        "text": "Do not think about other things, there is only one thing you can do. So master that one thing. Do not forget. What you must imagine is always that you, yourself, are the strongest. You do not need outside enemies. For you, the one you have to fight is none other than your own image.",
        "author": "Archer",
        "show": "Fate Stay Night"
    },
    {
        "text": "Life is like a tube of toothpaste. When you’ve used all the toothpaste down to the last squeeze, that’s when you’ve really lived. Live with all your might, and struggle as long as you have life.",
        "author": "Mion Sonozaki",
        "show": "Higurashi"
    },
    {
        "text": "Just like games, no matter how well you have things lined up in your life, there’s always something to keep you on your toes.",
        "author": "Gilgamesh",
        "show": "Fate Zero"
    },
    {
        "text": "Bad biscuits make the baker broke, bro.",
        "author": "Jake",
        "show": "Adventure Time"
    },
    {
        "text": "You’re letting your brain dial turn your fear volume up.",
        "author": "Finn",
        "show": "Adventure Time"
    },
    {
        "text": "People get built different. We don’t need to figure it out, we just need to respect it.",
        "author": "Princess Bubblegum",
        "show": "Adventure Time"
    },
    {
        "text": "You don’t need a mirror to look good. You’re beautiful on the inside.",
        "author": "Finn",
        "show": "Adventure Time"
    },
    {
        "text": "Sometimes life is scary and dark. That is why we must find the light.",
        "author": "BMO",
        "show": "Adventure Time"
    },
    {
        "text": "I don’t need to feel like I’m waiting to be noticed. I know who I am, and I’ll know what I want if and when it ever comes along.",
        "author": "Fionna",
        "show": "Adventure Time"
    },
    {
        "text": "Everything small is just a smaller version of something big.",
        "author": "Finn",
        "show": "Adventure Time"
    },
    {
        "text": "You won’t be able to tell if everything is going to be totally haywire.",
        "author": "BMO",
        "show": "Adventure Time"
    },
    {
        "text": "Suckin’ at something is the first step to being sorta good at something.",
        "author": "Finn",
        "show": "Adventure Time"
    },
    {
        "text": "I’m collecting them all first to be sure I make the right choice!",
        "author": "Ice King",
        "show": "Adventure Time"
    },
    {
        "text": "You’re getting hung up on imaginary problems. You got to focus on what’s real.",
        "author": "Jake",
        "show": "Adventure Time"
    },
    {
        "text": "Y’all are just hating on my steez. I’m not listening to haters.",
        "author": "Ice King",
        "show": "Adventure Time"
    },
    {
        "text": "Responsibility demands sacrifice.",
        "author": "Princess Bubblegum",
        "show": "Adventure Time"
    },
    {
        "text": "I don’t need to feel like I’m waiting to be noticed. I know who I am, and I’ll know what I want if and when it ever comes along.",
        "author": "Fionna",
        "show": "Adventure Time"
    },
    {
        "text": "I say creepy is just another label we used to distance ourselves from stuff we don’t understand. Or that it reminds us of something in ourselves that we’re not comfortable with. It just ain’t a real thing, ya know? Unless you choose to believe it.",
        "author": "Finn",
        "show": "Adventure Time"
    },
    {
        "text": "Something Weird might just be something familiar viewed from a different angle, and that’s not scary, right?",
        "author": "Marceline’s Mom",
        "show": "Adventure Time"
    },
    {
        "text": "Some people just make the world a worse place to be in just by being around, Jake. That's right, bad apples. ‘Lock 'em all up,’ I say. At the bottom of the ocean, where it's too dark to see.",
        "author": "Finn",
        "show": "Adventure Time"
    },
    {
        "text": "What you're feeling is called infatuation. The pain is the product of you overvaluing a projected, imaginary relationship with me.",
        "author": "Princess Bubblegum",
        "show": "Adventure Time"
    },
    {
        "text": "Dating girls is like riding a bicycle. If you mess up, you could get really hurt forever or hurt someone you really care about.",
        "author": "Finn",
        "show": "Adventure Time"
    },
    {
        "text": "I just thought about my anxieties, and it's like my mind hand touched a hot memory stove.",
        "author": "Carol",
        "show": "Adventure Time"
    },
    {
        "text": "People make mistakes. It’s all part of growing up, and you never really stop growing.",
        "author": "Duke of Nuts",
        "show": "Adventure Time"
    },
    {
        "text": "I don’t think there are bad people. I think good people do bad stuff sometimes, and that’s bad. But if you just do it once, that’s a mistake. And that’s not bad. I think.",
        "author": "Marceline",
        "show": "Adventure Time"
    },
    {
        "text": "Dude, sucking at something is the first step towards being sorta good at something.",
        "author": "Jake",
        "show": "Adventure Time"
    },
    {
        "text": "You know I care about you. I think you're making the right choice. Your natural lifespan is going to be richer and fuller than you can imagine. And someday, when you die, I'll be the one that puts you on the ground.",
        "author": "Marceline",
        "show": "Adventure Time"
    },
    {
        "text": "When bad things happen, I know you want to believe they are a joke, But sometimes life is scary and dark. That is why we must find the light.",
        "author": "BMO",
        "show": "Adventure Time"
    },
    {
        "text": "What are you..? This isn't about some petty love triangle! Flame Princess is physically unstable! Her elemental matrix can't handle extreme romance! Glob, if Finn tries to kiss her, she'll burn so hot, she'll melt right through the planet's crust, down through the molten core! ",
        "author": "Princess Bubblegum",
        "show": "Adventure Time"
    },
    {
        "text": "Who are you? Ha ha ha! I know, you're probably a... a biiiiiiig neeeerd! Hey baby, why don't you try being cool like me?",
        "author": "Ice King",
        "show": "Adventure Time"
    },
    {
        "text": "You were zapped by Darren the Ancient Sleeper, your dome was cracked, your root beer soaked into the ground! I buried your remains in a mason jar which is now your head, and... an-and now I'm—I'm with Starchy.",
        "author": "Cherry Cream Soda Girl",
        "show": "Adventure Time"
    },
    {
        "text": "I miffed off a wizard and he took my eyes. I wonder what he wanted them for. Some kind of lotion, or potion...or time-traveling spell? I'll never know!",
        "author": "Xergiok",
        "show": "Adventure Time"
    },
    {
        "text": "Thanks for responding to my call, guys. I'm in a serious pickle, and I mean the bad kind—I mean like, a really smelly brown pickle?",
        "author": "Prismo",
        "show": "Adventure Time"
    },
    {
        "text": "Listen, when I look at you, my brain goes all stupid, and I just wanna hug you and sit on the couch and play BMO with you!",
        "author": "Finn",
        "show": "Adventure Time"
    },
    {
        "text": "Sleep is a curse, and yet a curse I need to live.",
        "author": "Steven",
        "show": "Steven Universe"
    },
    {
        "text": "Stevonnie, listen to me. You are not two people. And you are not one person. You are an experience! Make sure you're a good experience.",
        "author": "Garnet",
        "show": "Steven Universe"
    },
    {
        "text": "Are you good? Are you safe? Do you still love me?",
        "author": "Gemcation",
        "show": "Steven Universe"
    },
    {
        "text": "If you're the one protecting me...Then who's the one protecting you?",
        "author": "Steven",
        "show": "Steven Universe"
    },
    {
        "text": "Someday soon, we may be fighting some really bad guys, and when that day comes, I want to fight with you, together!",
        "author": "Steven",
        "show": "Steven Universe"
    },
    {
        "text": "Maybe when Peridot gets to Earth, she'll see how nice all the people are, and she won't want to hurt anyone.",
        "author": "Steven",
        "show": "Steven Universe"
    },
    {
        "text": "You have so many worlds and I don't even have one! It's not fair! I. Want. One! I want my own army! I want my own planet! I deserve it! I'm just as important as you!",
        "author": "Stevonnie",
        "show": "Steven Universe"
    },
    {
        "text": "I know you do. Please, please understand if we lose, we'll be killed, and if we win, we can never go home.",
        "author": "Rose",
        "show": "Steven Universe"
    },
    {
        "text": "That was Rainbow Quartz. Pearl thought a fusion might give your video a little...something extra. Pretty cool, right?",
        "author": "Rose",
        "show": "Steven Universe"
    },
    {
        "text": "When a Gem is made, it's for a reason. They burst out of the ground already knowing what they're supposed to be, and then...that's what they are. Forever.",
        "author": "Greg",
        "show": "Steven Universe"
    },
    {
        "text": "But you, you're supposed to change. You're never the same even moment to moment -- you're allowed and expected to invent who you are. What an incredible power -- the ability to 'grow up'.",
        "author": "Greg",
        "show": "Steven Universe"
    },
    {
        "text": "Oh, no, I know what a nickname is. It's just that it reminds me so much of Pink. She used to give silly little names to everything. She was so funny like that.",
        "author": "Volleyball",
        "show": "Steven Universe"
    },
    {
        "text": "Isn't it remarkable, Steven? This world is full of so many possibilities.",
        "author": "Rose",
        "show": "Steven Universe"
    },
    {
        "text": "Steven, we can't both exist. I'm going to become half of you. And I need you to know that every moment you love being yourself, that's me, loving you and loving being you. Because you're going to be something extraordinary. You're going to be a human being.",
        "author": "Rose",
        "show": "Steven Universe"
    }
];
const randomNumber = Math.floor(Math.random() * quotes.length);

function quoteGen() {
    let fullquote = quotes[randomNumber].text + " - " + quotes[randomNumber].author + ", " + quotes[randomNumber].show;
    console.log(fullquote)
    let bottomquote = " - " + quotes[randomNumber].author + ", " + quotes[randomNumber].show;
    document.getElementById("QuoteAuthorShow").textContent = bottomquote;
    document.getElementById("QuoteText").textContent = quotes[randomNumber].text;
};

window.onload = quoteGen();

