from flask import Flask, render_template, request, flash
import mysql.connector
from datetime import datetime

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
def main():
    return "<h1>haha</h1>"

@app.route("/dashboard")
def dashboard():
    getQuery = "SELECT * FROM kendaraan"
    getTopup = "SELECT * FROM riwayat_topup"
    # addQuery = "INSERT INTO kendaraan VALUES(NULL,'232','2023-12-1','2023-12-2 23:23:23','2023-12-2 23:23:23','B12332')"
    # addData(addQuery)
    data = getData(getQuery)
    data_topup = getData(getTopup)
    return render_template("dashboard.html", data_kendaraan = data, data_topup = data_topup)

@app.route("/topup", methods=['GET','POST'])
def topup():
    getQuery = "SELECT * FROM riwayat_topup"    
    
    if request.method == 'POST':
        id = 111
        nama = 'lol'
        # id = request.form('uid')
        # nama = request.form('nama')
        nominal = request.form['nominal']
        
        curr_time = datetime.now()
        formatted_time = curr_time.strftime('%Y-%m-%d %H:%M:%S')
        print(formatted_time)
        
        getSaldoQuery = f"SELECT saldo FROM saldo_user WHERE id_kartu='{id}'"
        saldo = getOneData(getSaldoQuery)
        
        for data_saldo in saldo:
            saldo = data_saldo
            
        total = int(nominal)+saldo
        
        updateSaldoQuery = f"UPDATE saldo_user SET saldo='{total}' WHERE id_kartu='{id}'"
        isi_saldo = addData(updateSaldoQuery)
        flash(f'Top Up kartu {nama} sebesar Rp{nominal} berhasil dilakukan!', 'success')
        
        print('topup berhasil')    
        riwayatQuery = f"INSERT INTO riwayat_topup VALUES(NULL,'{id}','{nama}','{nominal}','{formatted_time}')"
        addData(riwayatQuery)
                
    
    data = getData(getQuery)
    return render_template("topup.html", data_topup = data)

@app.route("/addbalance", methods=['POST'])
def add_balance():
    pass

if __name__== "__main__":
    app.run(debug=True)