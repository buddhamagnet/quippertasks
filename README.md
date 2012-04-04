Welcome to my take on the Join Quipper test

[![Build Status](https://secure.travis-ci.org/buddhamagnet/quippertasks.png?branch=master)](http://travis-ci.org/buddhamagnet/quippertasks) 

As per instructions:

1. Use the latest stable Ruby - 1.9.3
2. Use the latest stable Rails - 3.2.3
3. Most of the code should be test-covered - pretty well covered IMHO
4. Using any database - sqlite3 in development, mySQL in production
5. Using any testing framework - used rspec, capybara, faker, launchy, guard and factory_girl
6. Using any open source libraries:

   A. devise for user authentication.
   B. twitter-bootstrap-rails for look and feel.
   C. pages controller for static pages.
   D. timecop for testing deadlines.

7. Using any web service - 
8. Not all stories have to be finished - they were!
9. Stories do not have to be finished in that order - again, they were.

COMPLETED STORIES

1. As a user, I want to create a task so that I will not forget something to do.
2. As a user, I want to create a task with a deadline so that I will not miss deadline.
3. As a user, I want to edit a task so that I can change a task after I created.
4. As a user, I want to mark a task as done so that I can distinguish incomplete tasks from complete ones.
5. As a user, I want to see all tasks which didn't meet deadline as of today.
6. As a user, I want to delete a task so that I can remove task which is not a task any more.
7. As a user, I want to see tasks list ordered by created date.
8. As a user, I want to see tasks list ordered by deadline.

WORKING EXAMPLE

Deployed to heroku at quippertest.heroku.com