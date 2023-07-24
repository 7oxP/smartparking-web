from flask import Flask, render_template, request, flash, redirect, url_for
from datetime import datetime
import mysql.connector
import random


app = Flask(__name__)
app.secret_key = '5m4rtp4rk1n9'

def getMysqlConnection():
    return mysql.connector.connect(host="localhost", user="root", password="", database="smartparking")

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

    dataKendaraan = getData("SELECT * FROM `log_kendaraan`")
    dataKeluar = getData("SELECT * FROM `log_kendaraan` WHERE isInside='0'")
    dataUser = getData("SELECT * FROM `user`")

    return render_template('dashboard.html', dataKendaraan=dataKendaraan, dataKeluar=dataKeluar, dataUser=dataUser)

@app.route('/daftar_user')
def daftar_user():
    query = "SELECT * FROM `user`"
    data = getData(query)
    print(data)
    return render_template('daftar_user.html', data=data)

@app.route("/userMasuk/<int:id>")
def userMasuk(id):
    query = f"SELECT * FROM `user` WHERE id_kartu='{id}'"
    data = getOneData(query)
    
    id_kartu = data[1]
    nama = data[2]
    nopol = data[4]

    query = f"INSERT INTO log_kendaraan VALUES (NULL,'{id_kartu}','{nama}',CURRENT_TIME(),CURRENT_TIME(),'{nopol}','1')"

    addData(query)

    return redirect(url_for("dashboard"))

@app.route("/userKeluar/<int:id>")
def motorKeluar(id):
    query = f"UPDATE `log_kendaraan` SET `waktu_keluar` = CURRENT_TIME(), `isInside` = '0' WHERE `log_kendaraan`.`id_kartu` = {id}"
    addData(query)

    return redirect(url_for("dashboard"))


if __name__ == '__main__':
    app.run(debug=True)
