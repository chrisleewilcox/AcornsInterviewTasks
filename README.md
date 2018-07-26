# AcornsInterviewTasks
Acorns Interview Tasks


This was developed on a Windows 10 machine just using a text editor.

# Part 1
Required Installs: Ruby, Firefox

Copy files from repository and install packages in the gemfile.  Set environment path to the './InterviewTasks/Part1/resources'.  Then run 'cucumber' from the command promt in the './InterviewTasks/Part1' folder.



# Part 2
Required Intalls: Ruby

Copy files from repository and install packages in the gemfile.  Then run 'rspec zillowsearch_spec.rb' from the command promt in the './InterviewTasks/Part2/spec' folder.



# Notes:

I was having issues with Capybara's 'wait_until' function so I resorted to using sleeps.  Will get back to getting
'wait_until' working if time permits.

As of 7/25/2018 at 2:00pm I was getting 404 error with the webservice doc pages for Property Details and Valuation API's.
- https://www.zillow.com/howto/api/HomeValuationAPIOverview.htm
- https://www.zillow.com/howto/api/PropertyDetailsAPIOverview.htm

Was not able to get the information needed for those webservices.  Will utilize another Zillow search
to automate.
  
  UPDATE: I ended up automating the GetRegionalChildren which returns a listing of homes based on parameters provided
  - https://www.zillow.com/howto/api/GetRegionChildren.htm
  
  
