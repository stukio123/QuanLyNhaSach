from flask import render_template, request, redirect, flash, url_for
from sqlalchemy import or_
from flask_login import login_user
from app import app, login
from app.admin import *
import hashlib

@app.route('/')
@app.route('/index')
def hello_world():
    return render_template('home.html')


@app.route('/book', methods=['GET'])
def book():
    keyword = request.args.get('keyword')
    print(keyword)
    if keyword :
        books = Sach.query.filter(Sach.name.like(keyword+'%')).all()
    else:
        books = Sach.query.all()
    return render_template('book.html', books=books)


@app.route('/book/add', methods=['GET', 'POST'])
def add_book():
    if request.method == 'GET':
        return render_template('addBook.html')
    if request.method == 'POST':
        return
    pass


@app.route('/book/<id>/edit', methods=['GET', 'POST'])
def edit_book(id):
    editBook = Sach.query.get(id)
    authors = Tacgia.query.all()
    categories = Theloai.query.all()
    if request.method == 'GET':
        print("Method get được gọi khi edit sách")
        return render_template('editBook.html', book=editBook, authors=authors, categories=categories)
    if request.method == 'POST':
        print("Method post được gọi khi edit sách")
        try:
            book = Sach.query.get(id)
            name = request.form['name']
            category = request.form['category']
            author = request.form['author']
            book.name = name
            book.category_id = category
            book.author_id = author
            db.session.commit()
            flash('Sửa thành công')
            return redirect(url_for('book'))
        except Exception as ex:
            flash(f"Lỗi khi sửa sách {ex}")
            return redirect(url_for('edit_book', id=id))


@app.route('/book/<id>/delete', methods=['GET'])
def del_book(id):
    print("Xóa book đc gọi")
    try:
        Sach.query.get(id).delete()
        flash("Xóa thành công")
        return redirect(url_for('book'))
    except Exception as ex:
        flash(f"Lỗi khi xóa {ex}")
        return redirect(url_for('book'))


@app.route('/import-book', methods=['GET', 'POST'])
def import_book():
    if request.method == 'GET':
        return render_template('importBook.html')
    if request.method == 'POST':
        return


@app.route('/CreateBill', methods=['GET', 'POST'])
def create_bill():
    if request.method == 'GET':
        return render_template('createBill.html')
    if request.method == 'POST':
        return

@login.user_loader
def user_load(user_id):
    return Taikhoan.query.get(user_id)

@app.route('/login-admin',methods=['GET','POST'])
def login_admin():
    if request.method == 'POST':
        email = request.form.get('email')
        password = request.form.get('password','')
        password = str(hashlib.md5(password.trip().encode('utf-8')).hexdigest())
        print(f"{email} | {password}")
        user = Taikhoan.query.filter(Taikhoan.Email == email.trip(), Taikhoan.MatKhau == password.trip()).first()
        if user:
            login_user(user)
    return redirect("/admin")


if __name__ == '__main__':
    app.run(debug=True)
