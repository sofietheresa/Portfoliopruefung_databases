import flask
from flask_cors import CORS
from flask import jsonify, request, redirect
import psycopg2 
import os

# define app
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

   # READ: Fetch all employees from the database
    @app.route('/')
    def fetch_all_employees():
        cur.execute('SELECT * FROM employees')
        rows = cur.fetchall()
        return jsonify(rows)

    # CREATE: Insert employees and add them to the db
    @app.route('/add-employee', methods=['GET', 'POST'])
    def add_employee():
        if request.method == 'POST':
            data = request.form.to_dict()
            cur.execute("INSERT INTO employees (employees_id, f_name, l_name, locations) VALUES (%s, %s, %s, %s)",
                        (data['ID'],  data['employeeFName'], data['employeeLName'], data['location']))
            con.commit()
            return redirect('http://localhost:3000')
        else:
            return 'Form submission failed'

    # DELETE: Delete employees by employeeId from the database
    @app.route('/delete-employee', methods=['GET','POST'])
    def delete_by_id():
        employee = request.form.to_dict()
        cur.execute(
            "DELETE FROM employees WHERE employees_id = %s" % (employee['ID']))
        con.commit()
        return redirect('http://localhost:3000')

    #UPDATED: Update employee by employeeId from the database
    @app.route('/update-employee', methods=['GET','POST'])
    def update_by_id():
        newdata = request.form.to_dict()
        sql = """UPDATE employees SET f_name = %s, l_name = %s, locations = %s WHERE employees_id = %s;"""
        cur.execute(sql,(newdata["employeeFName"], newdata['employeeLName'], newdata['location'], newdata['ID']))
        con.commit()
        return redirect('http://localhost:3000')

except:
    print('Error')


if __name__ == '__main__':
    app.run(host=os.getenv("app_host"), port="5000")