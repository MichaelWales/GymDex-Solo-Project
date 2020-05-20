# ABOUT THE PROJECT
---

This app is designed to be a tool that a gym could use to keep track of members, sessions and bookings. It takes into account different membership types, customised sessions, member details and booking that take the membership levels and membership activity into account.

The brief is as follows:

## Gym  
A local gym has asked you to build a piece of software to help them to manage memberships, and register members for classes.

### MVP  
The app should allow the gym to create and edit Members
The app should allow the gym to create and edit Classes
The app should allow the gym to book members on specific classes
The app should show a list of all upcoming classes
The app should show all members that are booked in for a particular class

### Possible Extensions  
Classes could have a maximum capacity, and users can only be added while there is space remaining.
The gym could be able to give its members Premium or Standard membership. Standard members can only be signed up for classes during off-peak hours.
The Gym could mark members and classes as active/deactivated. Deactivated members/classes will not appear when creating bookings."

---

## HOW TO RUN THE APP
---

NOTE: The app was designed and tested in Google Chrome and so it is advised to use Chrome when navigating.

A. Download the Repo using the green "Clone or Download" button at the top right of this project's GitHub page.  
B. Using Terminal (or another CLI) navigate to the "project" folder and run the following commands:  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1) createdb gymdex  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2) psql -d gymdex -f db/gymdex.sql  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3) ruby db/seeds.rb  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4) Open another Terminal tab/window and run psql -d gymdex  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5) Open another Terminal tab/window and run ruby app.rb  
C. Finally, open Chrome and enter localhost:4567 in the address bar.  
D. Enjoy!  

---
---
