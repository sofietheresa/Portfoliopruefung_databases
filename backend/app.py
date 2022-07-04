import flask
from flask_cors import CORS
import json
from flask import jsonify, request
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


     # GET: Fetch all books from the database
    @app.route('/')
    def fetch_all_books():
        cur.execute('SELECT * FROM books')
        rows = cur.fetchall()
        print(rows)

        return jsonify(rows)

    # GET: Fetch book by bookId from database
    @app.route('/<int:book_id>')
    def fetch_by_id(book_id=None):
        cur.execute(f'SELECT * FROM books WHERE book_id = {book_id}')
        rows = cur.fetchall()
        print(rows)

        return jsonify(rows)

    # POST: Create books and add them to the database
    @app.route('/add-book', methods=['GET', 'POST'])
    def add_movie():
        if request.method == 'POST':
            data = request.form.to_dict()
            print(data)
            cur.execute("INSERT INTO book (book_name, release_year, summary, director, genre, rating, movie_runtime, meta_score) VALUES (%s, %s, %s, %s, %s, %s, %s, %s)",
                        (f"{data['bookName']}",  data['releaseYear'], f"{data['summary']}",
                         f"{data['director']}", f"{data['genre']}", f"{data['rating']}", data['movieRuntime'], data['metaScore']))
            con.commit()
            return 'Form submitted'
        else:
            return 'Form submission failed'

    # DELETE: Delete books by bookId from the database
    @app.route('/delete-book', methods=['GET', 'DELETE'])
    def delete_by_id():
        book_id = request.form.to_dict()
        print(book_id['bookId'])
        cur.execute(
            f"DELETE FROM book WHERE book_id = {book_id['bookId']} RETURNING book_name")
        con.commit()

        return 'Book Deleted'

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