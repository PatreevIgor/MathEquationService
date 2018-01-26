# Application to solve mathematical equations (back end application)

The application accepts requests JSON format with the given parameters to solve the equation, solves the equation and sends the response to the user. The response consists of a response code and result.
The app is fully covered by unit tests (Rspec).

Requests are sent to: http://localhost:3000/api/equations/solve

Response code:

  0 - success, the equation has one or 2 solutions

  1 - validation_error, validation error

  2 - wrong_type, wrong type equations

  3 - infinity, the equation has infinite number of solutions

  4 - no_solutions, the equation is not have solutions

Query parameters:

  type - the type of the equation, possible options are 'linear', 'quadratic';

  a    - the value of a variable linear or quadratic equation, available format: string, integer;

  b    - the value of a variable linear or quadratic equation, available format: string, integer;

  c    - the value of the variable quadratic equations, available format: string, integer.

Validations:

  Type checking of the equation

  Type checking variables of the equation

  Check presence the variables of the equation

Example query:

  Successful queries and answers:

    1. Solution of linear equations, there are 3 possible cases:

      1.1 The Equation has one solution.

        Sample request: { type: 'linear', a: 1, b: 2 }

        Example response: {"result":-2.0,"code":0}

      1.2 Equation has many solutions.

        Sample request: {type: 'linear', a: 0, b: 0}

        Example response: {"result":"Sorry, this equation has infinity solutions","code":3}

      1.3 The Equation has no solutions.

        Sample request: {type: 'linear', a: 0, b: 1}

        Example response: {"result":"Sorry, this equation does not have solutions","code":4}

    2. The solution to the quadratic equation, there are 3 possible cases:

      2.1 The Equation has one solution.

        Sample request: { type: 'quadratic', a: 1, b: 2, c: 1 }

        Example response: {"result":-1.0,"code":0}

      2.2 the Equation has two solutions.

        Sample request: { type: 'quadratic', a: 1, b: 2, c: -3 }

        Example response: {"result":[1.0,-3.0],"code":0}

      2.3 the Equation has no solutions.

        Sample request: { type: 'quadratic', a: 1, b: 2, c: 5 }

        Example response: {"result":"Sorry, this equation does not have solutions","code":4}

  Erroneous queries and answers:

    1. Wrong type of equation, or its absence:

      Sample request: { type: 'unknown_type', a: 1, b: 2, c: 5 }

      Example response: {"errors":"This type of equation is not supported","code":2}

    2. Invalid type passed to variables:

      Sample request: { type: 'linear', a: 'string', b: 2, c: 5 }

      Example response: {"errors":"A is not a number","code":1}

    3. Missing variables to solve the equation:

      Sample request: { type: 'linear', b: 2, c: 5 }

      Example response: {"errors":"can't be blank and A is not a number","code":1}
