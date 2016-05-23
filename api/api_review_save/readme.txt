/*
* Author : Subhadip Layek
* MCA 2K13
* NIT JAMSHEDPUR
* +91 8235442043
*/

BookServer is a simple Book catalogue API.

**KEY FEATURES**
  # users can query a books details by simple GET request with param 'title'
  response will be json response with exact or similar book title & price.
  If 'title' not supplied response will be the complete list of books details.

  # users can add new books details by POST request with params 'title' and 'price'
  validation is there for empty value & duplicate entry checking.
  successful response will be id of last entry.


  # users can update any existing books details by PUT request with params 'title', 'price' and 'old_title'
  successful response will be no of rows effected.

  # users can delete any books title by DELETE request with param 'title'

  **Upcoming features
    #login module
    #social login
    


**TECHNOLOGY USED**
    # PHP 5.5.9-1ubuntu4.14
    # MySql Server 5.5.46-0ubuntu0.14.04.2
    # Medoo 1.0.2

**TESTING**
  #Tested using
    jquery ajax HTTP requests (GET, POST, PUT, DELETE)
    cURL 7.35.0
