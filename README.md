# About the project
The project consists of a web platform for headhunters and candidates to relate around job openings. Applicants can create 
a platform account to search for vacancies and apply for selection processes. Headhunters register their vacancies and 
register candidates. From applying for an applicant to a vacancy, there can be a message exchange, appointment scheduling, 
proposal submission and feedback.

## How to start the project
To run this project you must have a computer, preferably running Linux, with the Ruby programming language in version 2.6.3.
Within the project directory, you must install the dependencies defined in the Gemfile file with the bundle install command.
With all dependencies installed, run rails server and access localhost: 3000 in your browser.

## Running the tests
With all dependencies installed, as described in the previous section, on your terminal run rspec.

## How to navigate the platform
Browsing the platform will only be possible through one of the following users: :applicant (applicant@applicant.com), 
:admin (admin@admin.com) or :headhunter (headhunter@headhunter.com). As 'applicant' you will only have access to the candidate
profile, if 'headhunter' access to the headhunter profile and as 'admin' access control. If you register another type of user 
will have access only to 'Home'.

Ps.: To view the messages, comments or feedbacks exchanged between 'candidate' and 'headhunter' you must log in and log out 
to their respective users. Because messages sent by the headhunter are displayed on the candidate's panel; as well as those 
of the candidate on the headhunter panel.
