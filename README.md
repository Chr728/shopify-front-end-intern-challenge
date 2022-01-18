# shopify-front-end-intern-challenge
Author: Christina Darstbanian

#VERY IMPORTANT NOTE#
I TRIED HOSTING MY PROJECT ON HEROKU BUT THE FACT THAT ITS A JSP I HAD  SOME DIFFICULTIES BECAUSE MOST WEB HOSTING SITES DID NOT RECOGNIZE IT. IT WAS SUCCESSFULLY DEPLOYED ON HEROKU AT THE END BUT IT WAS ALWAYS GIVING 503 (Service Unavailable) , THEREFORE I WAS NEVER ABLE TO TEST IT ON HEROKU, THE  WEBSITE IS : https://merayes.herokuapp.com/      .BUT PLEASE DO NOT USE THAT SITE AND  RATHER  IN ORDER TO FACILITATE YOUR TESTING PLEASE REFER TO  THIS DOCUMENTATION:https://www.cs.virginia.edu/~up3f/cs4640/supplement/jsp-deployment.html?fbclid=IwAR1H0rUYnBDWsy9ZvtooqhvrPHm1_YacU2qXFNjAm3bKfxUZDSQvOcZT2fI  .IT SHOWS HOW TO TEST IT USING TOMCAT WHERE IT CAN EASILY BE TESTED BY DOWNLADING THE IDE   PLEASE ACCEPT APOLOGIES AND REFER TO THE TOMACT SITE I ADDED. 


The website: 
Objective
Develop a webpage that can fetch images from one of Nasa's api. The api chosen is  Nasa APOD API 

Description
This website once opened, it shows the user the images of the last 10 days by default , in other words the website displays the picture of the last 10 days. 
In addition to that it also shows the title, date and descrption of the image. Another feature that was implemented is to make the user able to pick any date in the calender( it should be reasonable range (API has it available since July 1995) and let the user see the image of that specific date chosen by him/her.
the user also can always like and unlike an image, it is always stored. Most importantly that the front end components were implemented in a way to make sure that the site is responsive no matter what size it gets the page always adjusts to it. When the user realods or refreshes the page the values of a specific picture that was saved/unsaved is maintained and stored (if it was liked then it shows  still "unlike"  even after refreshing the page , it shows unlike because it was already liked so the only option is to unlike now) 
