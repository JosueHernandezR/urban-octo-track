from flask_login import UserMixin
from werkzeug.security import generate_password_hash, check_password_hash
from run import db
from sqlalchemy.orm import load_only
from flask import jsonify 

class User(db.Model, UserMixin):
    __tablename__ = 'tracking_user'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), nullable=False)
    email = db.Column(db.String(256), unique=True, nullable=False)
    password = db.Column(db.String(128), nullable=False)
    is_admin = db.Column(db.Boolean, default=False)
    devices = db.relationship('Device', backref='devices', lazy=True)
    def __repr__(self):
        return f'<User {self.email}>'
    def set_password(self, password):
        self.password = generate_password_hash(password)
    def check_password(self, password):
        return check_password_hash(self.password, password)
    def save(self):
        if not self.id:
            db.session.add(self)
        db.session.commit()
    @staticmethod
    def get_by_id(id):
        return User.query.get(id)
    @staticmethod
    def get_by_email(email):
        return User.query.filter_by(email=email).first()

class Device(db.Model):
    __tablename__ = 'device_tracker'
    id = db.Column(db.Integer, primary_key=True)
    user_id = db.Column(db.Integer, db.ForeignKey('tracking_user.id'), nullable=False)
    name = db.Column(db.String(80), nullable=False)
    tipodispositivo = db.Column(db.String(40), nullable=False)
    macaddress = db.Column(db.String(40), nullable=False)
    latitud = db.Column(db.String(40), nullable=True)
    longitud = db.Column(db.String(40), nullable=True)
    def save(self):
        db.session.add(self)
        db.session.commit()

    @staticmethod
    def get_by_user(ids):
        return Device.query.filter_by(user_id=ids).all()

    @staticmethod
    def get_by_userTrack(ids):
        tracking = list()
        result = Device.query.filter_by(user_id=ids).options(load_only('name', 'macaddress', 'latitud', 'longitud')).all()
        for item in result:
            keys = ['name','macaddress','latitud','longitud']
            datos = [item.name,item.macaddress,item.latitud,item.longitud]
            tracking.append(dict(zip(keys,datos)))
        return tracking

class Zonageografica(db.Model):
    __tablename__ = "zona_geografica"
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(200), nullable=False)
    id_api = db.Column(db.String(200), nullable=False)
    qtyap = db.Column(db.Integer, nullable=False)
    def save(self):
        db.session.add(self)
        db.session.commit()

    @staticmethod
    def get_all():
        return Zonageografica.query.all()