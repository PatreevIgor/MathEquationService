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


Сервис позволяет решать линейные и квадратные уравнения методом обмена JSON запросов.
Запросы отправляются на адрес: http://localhost:3000/api/equations/solve

Параметры запросов:
  type - тип уравнения, возможные варианты 'linear', 'quadratic'
  a    - значение переменной линейного либо квадратного уравнения, доступный формат: string, integer
  b    - значение переменной линейного либо квадратного уравнения, доступный формат: string, integer
  c    - значение переменной квадратного уравнения, доступный формат: string, integer

Валидации:
  Проверка типа уравнения
  Проверка типа переменных уравнения
  Проверка полноты переменных уравнения

Коды ответов:
  0 - success, уравнение имеет одно или 2 решения
  1 - validation_error, ошибка валидации
  2 - wrong_type, неверный тип уравнения
  3 - infinity, уравнение имеет бесконечное множество решений
  4 - no_solutions, уравнение не иемеет решений

Примеры запросов:
  Успешные запросы и ответы на них:
    1. Решение линейного уравнения, возможны 3 случая:
      1.1 Уравнение имеет одно решение.
        Пример запроса: { type: 'linear', a: 1, b: 2 }
        Пример ответа:  {"result":-2.0,"code":0}

      1.2 Уравнение имеет много решений.
        Пример запроса: {type: 'linear', a: 0, b: 0}
        Пример ответа:  {"result":"Sorry, this equation has infinity solutions","code":3}

      1.3 Уравнение не имеет решений.
        Пример запроса: {type: 'linear', a: 0, b: 1}
        Пример ответа:  {"result":"Sorry, this equation does not have solutions","code":4}

    2. Решение квадратного уравнения, возможны 3 случая:
      2.1 Уравнение имеет одно решение.
        Пример запроса: { type: 'quadratic', a: 1, b: 2, c: 1 }
        Пример ответа:  {"result":-1.0,"code":0}

      2.2 Уравнение имеет два решения.
        Пример запроса: { type: 'quadratic', a: 1, b: 2, c: -3 }
        Пример ответа:  {"result":[1.0,-3.0],"code":0}

      2.3 Уравнение не имеет решений.
        Пример запроса: { type: 'quadratic', a: 1, b: 2, c: 5 }
        Пример ответа:  {"result":"Sorry, this equation does not have solutions","code":4}

  Ошибочные запросы и ответы на них:
    1. Неверный тип уравнения, либо его отсутствие:
      Пример запроса: { type: 'unknown_type', a: 1, b: 2, c: 5 }
      Пример ответа:  {"errors":"This type of equation is not supported","code":2}

    2. Неверный тип передаваемых переменных:
      Пример запроса: { type: 'linear', a: 'string', b: 2, c: 5 }
      Пример ответа:  {"errors":"A is not a number","code":1}

    3. Нехватает переменных для решения уравнения:
      Пример запроса: { type: 'linear', b: 2, c: 5 }
      Пример ответа:  {"errors":"A can't be blank and A is not a number","code":1}


Описание классов:

EquationParamsValidator
LinearEquationParamsValidator < EquationParamsValidator
LinearEquationSolver
QuadraticEquationParamsValidator < EquationParamsValidator
QuadraticEquationSolver

ErrorResponsePresenter
SuccessResultPresenter
TypeErrorResponsePresenter
+модуль ошибок

LinearEquationsController < ApplicationController
QuadraticEquationsController < ApplicationController
