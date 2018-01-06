# SkiApp
IOS application for our Skischool

## Prerequisites

### HomeBrew for MacOS
If you don't have homebrew you can install using this command: 
```/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"```

### MongoDB
If you don't have mongoDB you can install using this command: 
```brew install mongodb```

## Installation

Clone this respository and open 'Skischool.xcworkspace' with xcode

Open a terminal window and navigate to the repository and do ```pod install```

In the same terminal window now do ```npm install``` (this will install the packages needed to run a localhost server)

Now do ```node server.js``` and the server should be up and running on port 5000. No go to your browser and type: 'localhost:5000/api/setup'
This will create a fake account for you to login using the app.

Username: erik@test.be
Password: test

Now run the app with xcode and you are ready to explore!
