# About the project
The project consists of a web platform for headhunters and applicants to relate around job openings. Applicants can create a platform account to search for jobs and apply for selection processes. The headhunters
register your jobs and receive applications from applicants. From the registration of a applicant in a job, there can be a message exchange, appointment scheduling, proposal submission and feedback.

## How to start the project
To run this project you must have a computer, preferably running Linux, with the Ruby programming language in version 2.6.3.
Within the project directory, you must install the dependencies defined in the Gemfile file with the bundle install command.
With all dependencies installed, run rails server and access localhost: 3000 in your browser.

## Running the tests
With all dependencies installed, as described in the previous section, on your terminal run rspec.

## How to navigate the platform
Create three users in Sign up: admin@admin.com, applicant@applicant.com and headhunter@headhunter.com. 

As 'admin' you will only have access to access control, as 'applicant' will have access to the applicant profile and 'headhunter' access to the headhunter profile. If you register another type of user will have access only to 'Home'.

Ps.: To view the messages, comments or feedbacks exchanged between 'applicant' and 'headhunter' you must log in and log out to their respective users. Because messages sent by the headhunter are displayed on the applicant's panel; as well as those of the applicant on the headhunter's panel.
