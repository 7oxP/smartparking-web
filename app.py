from flask import Flask, render_template, request, flash, redirect, url_for
from datetime import datetime
import mysql.connector
import random


app = Flask(__name__)
app.secret_key = '5m4rtp4rk1n9'

def getMysqlConnection():
    return mysql.connector.connect(host="localhost", user="root", password="", database="iotik")

def addData(query):
    db = getMysqlConnection()
    cur = db.cursor()
    cur.execute(query)
    db.commit()

def getData(query):
    db = getMysqlConnection()
    cur = db.cursor()
    cur.execute(query)
    listData = cur.fetchall()
    
    return listData

def getOneData(query):
    db = getMysqlConnection()
    cur = db.cursor()
    cur.execute(query)
    listData = cur.fetchone()
    
    return listData


@app.route("/")
def index():
    return redirect(url_for("landingpage"))

@app.route('/landingpage')
def landingpage():
    return render_template('landingpageiotik.html')

@app.route('/regist', methods=['GET', 'POST'])   
def regist():							
    if request.method == 'GET':
        return render_template('daftar_kartu.html')	
    elif request.method =='POST':
        id_kartu = random.randint(10000, 20000)
        nama = request.form['nama']			
        email = request.form['email']	
        nopol = request.form['nopol']
        
        query = f"INSERT INTO `user` VALUES (NULL,'{id_kartu}','{nama}','{email}','{nopol}')"
        addData(query)

        return render_template('landingpageiotik.html')

@app.route('/login', methods=['GET', 'POST'])
def login():
    output = getData("SELECT * FROM `admin`")

    if request.method == 'GET':
        return render_template('login.html')

    elif request.method =='POST':
        user = request.form['username']			
        password = request.form['password']	

        for kolom in output:
            for i in range(len(kolom)):
                if str(user) == kolom[i]:
                    print(str(user))
                    if str(password) == kolom[i+1]:
                        print(str(password))
                        return redirect(url_for('dashboard'))
                    else:
                        break
        print('invalid username/password', 'error')
        return render_template('login.html')

@app.route('/dashboard')
def dashboard():

    dataKendaraan = getData("SELECT * FROM `kendaraan`")
    dataKeluar = getData("SELECT * FROM `kendaraan` WHERE isInside='1'")
    dataUser = getData("SELECT * FROM `user`")
    return render_template('dashboard.html', dataKendaraan=dataKendaraan, dataKeluar=dataKeluar, dataUser=dataUser)

@app.route('/daftar_user')
def daftar_user():
    query = "SELECT * FROM `user`"
    data = getData(query)
    print(data)
    return render_template('daftar_user.html', data=data)


if __name__ == '__main__':
    app.run(debug=True)
