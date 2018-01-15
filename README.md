# Application to solve mathematical equations

The system should contain 2 main components:


Frontend server

RoR application must provide:
1. Selection of the type of equation (the default are linear and quadratic)
2. The form for inputting the parameters of the solution
3. Sending the parameters of the equation to the backend server using JSON
4. Displaying the result in the "friendly" format.

Features are welcome:

1. Use CSS for web page design (input form, result page, progress bar/spinner)
2. Use JS / Ajax / JS-framework in forms, selection page, input, output, and validation
3. Use test frameworks TestUnit / RSpec / Cucumber (one or more)
4. Validate parameters and handle exceptions (500 backend, entering letters parameters, input of fractional parameters,etc.)


Backend server requirements

The application must be written in Ruby or Sinatra or similar framework, NOT Rails or RailsAPI.
The application must:

1. Provide an API for the parameters for solving equation
2. Solve the equation
3. Return the response in JSON format

Features are welcomed:

1. Use class inheritance to provide single object interface for solving various types of equations.
2. Use parameter validations and exception handling (insufficient number of parameters, wrong type of equation, wrong type of argument, etc.) and return the error in friendly format.
3. Use TestUnit / RSpec / Cucumber (one or more)
4. Using the authentication to backend access
