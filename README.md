# README

## Grocery Project 

Grocery list web-application that allows real-time sharing by multiple people. Users can create/update/delete lists, add items, delete items, and mark items as complete/incomplete.

## Usage

https://morning-dawn-30677.herokuapp.com/  
* sign up with email and password

## Installation 

* Clone the repository
* Make sure Ruby and Rails are installed
* Use Bundle to install gems 
* Migrate the database locally
* Run the Rails Server using `$ rails s`
* Navigate to http://localhost:3000

## Technical 

* I chose to use Ruby on Rails with Action Cable. Deployed using Heroku. 
* The job I have lined up will require me to use Ruby on Rails, which was my primary reason for choosing the framework for my project. Ruby is also my favorite programming language so far. 
* Action Cable is fairly new and therefore had little documentation. This made it harder to find troubleshooting tips. I'm curious to see how documentation develops over time. 
* Used request specs instead of controller specs.  

## With more time

* More complete testing 
* Sign-out link
* Ensure authorization is performed correctly
* Add cross-out visual for completed items 
* Fix unresolved bugs 


## Trade-offs 

* Was able to use Action Cable to get the project finished faster as opposed to writing it all from scratch, but there was little documentation. 
* Using Rails to implement real-time functionality felt a bit more clunky than what I would normally use Rails for. Might have been more seamless if I had integrated React.

## Bugs

* Resolved - Real-time item editing - fixed by combining delete and create functionality into one method. 
* Resolved - Dynamically added checkboxes, which could not be checked until you refresh the page. Added an event handler “change” to new checkboxes, so that their checked status is saved to the database. 
* Unresolved - checkbox after editing. An item checked in both windows, will uncheck in one window after being edited in the other. Corrects itself after another click.  
* Unresolved - “forgot password” link doesn’t send an email. 
* Unresolved - real-time edits get appended to the bottom. 

