from flask import Flask
from flask_restful import Resource, Api
import pyodbc
from os import environ

app = Flask(__name__)
api = Api(app)


def create_db_connection():
    connection_string = (str.join('DRIVER=MySQL ODBC 8.0 ANSI Driver;',
                                  'SERVER=', str(environ.get('SERVER')), ';',
                                  'DATABASE=', str(environ.get('DATABASE')), ';'
                                  'UID=', str(environ.get('USERNAME')), ';',
                                  'PWD=', str(environ.get('PASSWORD')), ';',
                                  'charset=utf8mb4;'))
    cnxn = pyodbc.connect(connection_string)
    cursor = cnxn.cursor()
    return cursor


def test_query(cursor_object, query):
    cursor_object.execute(query)
    return query.fetchall()


def touch_database():
    return test_query(create_db_connection(), 'SELECT * FROM TEST_TABLE')


class TouchDb(Resource):
    def get(self):
        return touch_database()


api.add_resource(TouchDb, '/touch_tb')

if __name__ == '__main__':
    app.run(port=80)
