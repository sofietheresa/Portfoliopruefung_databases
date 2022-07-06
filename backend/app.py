import flask
from flask_cors import CORS
import json
from flask import jsonify, request, redirect
import psycopg2 
import os

app = flask.Flask(__name__)
CORS(app, support_credentials=True, resources={r"/*": {"origins": "*"}})
app.config["DEBUG"] = True

try:
    #connect to db
    dbconn = {'database':"postgres",
            'user': "postgres",
            'host': "localhost",
            'port': "5432",
            'password': "1909"}

    con = psycopg2.connect(**dbconn)
    cur = con.cursor()


   #  GET: Fetch all employees from the database
    @app.route('/')
    def fetch_all_employees():
        cur.execute('SELECT * FROM employees')
        rows = cur.fetchall()
        print(rows)
        return jsonify(rows)


    # GET: Fetch book by bookId from database
    @app.route('/<int:id>')
    def fetch_by_id(employee_id=None):
        cur.execute(f'SELECT * FROM employees WHERE id = {id}')
        rows = cur.fetchall()
        print(rows)
        return jsonify(rows)

    # POST: Insert employees and add them to the db
    @app.route('/add-employee', methods=['GET', 'POST'])
    def add_employee():
        if request.method == 'POST':
            data = request.form.to_dict()
            print(data)
            cur.execute("INSERT INTO employees (id, f_name, l_name, location_id) VALUES (%s, %s, %s, %s)",
                        (data['ID'],  data['employeeFName'], data['employeeLName'], data['location']))
            con.commit()
            return redirect('http://localhost:3000', code="200")
        else:
            return 'Form submission failed'

    # DELETE: Delete employees by employeeId from the database
    @app.route('/delete-employee', methods=['GET','POST'])
    def delete_by_id():
        employee = request.form.to_dict()
        print(employee['ID'])
        cur.execute(
            "DELETE FROM employees WHERE id = %s" % (employee['ID']))
        con.commit()
        return redirect('http://localhost:3000', code="200")

    # PUT: Update book by bookId from the database
    @app.route('/update-book', methods=['GET', 'PUT'])
    def update_by_id():

        cur.execute(
            'UPDATE books SET book_name = \'Goldeneye\' WHERE book_id = 1')
        con.commit()

        return 'Movie Updated'

except:
    print('Error')


if __name__ == '__main__':
    app.run(host=os.getenv("app_host"), port="5000")