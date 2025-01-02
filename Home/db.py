import os

MYSQL = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'dbh2o',
        'USER': os.getenv('DATABASE_USER', 'myuser'),
        'PASSWORD': os.getenv('DATABASE_PASSWORD', 'ubuntu08-'),
        'HOST': os.getenv('DATABASE_HOST', 'localhost'),
        'PORT': os.getenv('DATABASE_PORT','3306'),
                                'OPTIONS': {'init_command': "SET sql_mode='STRICT_TRANS_TABLES'"},
    }
}
