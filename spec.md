# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app — DONE.
I've installed the Sinatra gem to create my web app with Ruby.


- [x] Use ActiveRecord for storing information in a database  
I've created Active Record models and am using Active Record naming conventions to connect my models and databse. 


- [X] Include more than one model class (e.g. User, Post, Category)
There are three models: User, Favorite, and URL. 


- [X] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
User has_many favorites


- [X] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
URL belongs_to favorites as well as users. Favorites belong to Users.


- [X] Include user accounts with unique login attribute (username or email)
Added condition that uses the find by method to find an existing user with that username or email. If a user exists, then signup redirects them to login or signup with different credentials.

- [X] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
Users who have many favorites may create, edit, see updates and delete favorite things from within their login session. 

- [X] Ensure that users can't modify content created by other users
During edit/update/delete functions, I made sure to include parameters comparing the favorite instance's user id to the id of the "current user," which is defined in my helpers block within the application controller. 

- [X] Include user input validations
There are if/else statements to prevent users from inputting blank fields as well as validations to prevent them from accessing content that does not belong to them. 

- [X] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
I've included both success and error messages using Rack::Flash. 

- [X] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code
Updated file with all requirements.

Confirm
- [X] You have a large number of small Git commits
- [X] Your commit messages are meaningful
- [X] You made the changes in a commit that relate to the commit message
- [X] You don't include changes in a commit that aren't related to the commit message