<?php

return [
    'db' => [
        'host' => getenv('MYSQL_HOST') ?: 'db',
        'database' => getenv('MYSQL_DATABASE') ?: 'camagru',
        'user' => getenv('MYSQL_USER') ?: 'user',
        'password' => getenv('MYSQL_PASSWORD') ?: 'secret',
    ],
    'app' => [
        'url' => 'http://localhost:8080',
        'secret' => getenv('APP_SECRET') ?: 'some_random_secret_key'
    ],
];
