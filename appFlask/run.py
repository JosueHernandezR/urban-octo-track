from flask import Flask, render_template, request, url_for, redirect
from forms import SignupForm, LoginForm, DeviceForm
from werkzeug.urls import url_parse
from flask_login import LoginManager
from flask_sqlalchemy import SQLAlchemy
import requests
from flask import json
from flask_login import current_user, login_user, logout_user, login_required

app = Flask(__name__,static_url_path='/static')
app.config['SECRET_KEY'] = '7110c8ae51a4b5af97be6534caef90e4bb9bdcb3380af008f90b23a5d1616bf319bc298105da20fe'
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://utracking:passTracking@localhost:5432/tracking'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
login_manager = LoginManager(app)
login_manager.login_view = "login"
db = SQLAlchemy(app)
from models import User, Device, Zonageografica

def apiGet(api):
    return requests.get(url='https://aruba.easygetpaid.com/hackathon/'+api)

@login_manager.user_loader
def load_user(user_id):
    return User.get_by_id(int(user_id))

@app.route("/signup/", methods=["GET", "POST"])
def show_signup_form():
    if current_user.is_authenticated:
        return redirect(url_for('index'))
    form = SignupForm()
    error = None
    if form.validate_on_submit():
        name = form.name.data
        email = form.email.data
        password = form.password.data
        # Comprobamos que no hay ya un usuario con ese email
        user = User.get_by_email(email)
        if user is not None:
            error = f'El email {email} ya está siendo utilizado por otro usuario'
        else:
            # Creamos el usuario y lo guardamos
            user = User(name=name, email=email)
            user.set_password(password)
            user.save()
            # Dejamos al usuario logueado
            login_user(user, remember=True)
            next_page = request.args.get('next', None)
            if not next_page or url_parse(next_page).netloc != '':
                next_page = url_for('index')
            return redirect(next_page)
    return render_template("signup_form.html", form=form, error=error)

@app.route('/login', methods=['GET', 'POST'])
def login():
    if current_user.is_authenticated:
        return redirect(url_for('index'))
    form = LoginForm()
    if form.validate_on_submit():
        user = User.get_by_email(form.email.data)
        if user is not None and user.check_password(form.password.data):
            login_user(user, remember=form.remember_me.data)
            next_page = request.args.get('next')
            if not next_page or url_parse(next_page).netloc != '':
                next_page = url_for('index')
            return redirect(next_page)
    return render_template('login_form.html', form=form)

@app.route('/addDevice', methods=['GET', 'POST'])
@login_required
def addDevice():
    form = DeviceForm()
    devices = Device.get_by_user(current_user.id)
    if form.validate_on_submit():
        name = form.name.data
        tipodispositivo = form.tipodispositivo.data
        macaddress = form.macaddress.data
        id = current_user.get_id()
        device = Device(user_id=id, name=name, tipodispositivo=tipodispositivo, macaddress=macaddress)
        device.save()
        return redirect(url_for('index'))
    return render_template('addDevice_form.html', form=form, devices=devices)

def login():
    if current_user.is_authenticated:
        return redirect(url_for('index'))
    form = LoginForm()
    if form.validate_on_submit():
        user = User.get_by_email(form.email.data)
        if user is not None and user.check_password(form.password.data):
            login_user(user, remember=form.remember_me.data)
            next_page = request.args.get('next')
            if not next_page or url_parse(next_page).netloc != '':
                next_page = url_for('index')
            return redirect(next_page)
    return render_template('login_form.html', form=form)

@app.route("/")
def index():
    return render_template("index.html")

@app.route("/tracking_dispositives")
def tracking_dispositives():
    zonas = Zonageografica.get_all()
    response = apiGet('tenants/').json()
    for item in response:
        if validaNombre(item['name'])==True:
            print("Existe")
        else:
            response2 = apiGet('tenants/'+str(item['customer_id'])+'/ap').json()
            lonZona = len(response2)
            zonageo = Zonageografica(name=item['name'], id_api=item['customer_id'], qtyap=lonZona)
            zonageo.save()
    return render_template("tracking_dispositives.html", zonas=zonas)

@app.route("/tracking_realtime")
def tracking_realtime():
    devices = Device.get_by_user(current_user.id)
    return render_template("tracking_realtime.html", devices=devices)

@app.route('/logout')
def logout():
    logout_user()
    return redirect(url_for('index'))

def validaNombre(nombre):
    zonas = Zonageografica.get_all()
    for zona in zonas:
        print("zona"+str(zona.name)+"nombre"+str(nombre))
        if nombre == zona.name:
            return True
    else:
        return False

@app.route('/tracking')
def tracking():
    data = Device.get_by_userTrack(current_user.id)
    response = app.response_class(
        response=json.dumps(data),
        status=200,
        mimetype='application/json'
    )
    return response