<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>BitPin Task</title>
    </head>
    <body >
        <h1>BitPin Task</h1>

        <h2>Project Version: {{ BITPIN_VERSION }}</h2>

        <h2>Project Details</h2>
        <h3>This project has 2 routes:</h3>
        <span>
            Set value in cache: GET /set-value/{key}/{value}<br/>
            Get value in cache: GET /get-value/{key}
        </span>

        <br/><br/><br/><br/><br/><br/>
        <div class="ml-4 text-center text-sm text-gray-500 sm:text-right sm:ml-0">
            Laravel v{{ Illuminate\Foundation\Application::VERSION }} (PHP v{{ PHP_VERSION }})
        </div>
    </body>
</html>
