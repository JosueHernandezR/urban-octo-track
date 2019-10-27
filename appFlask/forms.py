from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField, PasswordField, BooleanField, SelectField
from wtforms.validators import DataRequired, Email, Length

class SignupForm(FlaskForm):
    name = StringField('Nombre', validators=[DataRequired(), Length(max=64)])
    password = PasswordField('Password', validators=[DataRequired()])
    email = StringField('Email', validators=[DataRequired(), Email()])
    submit = SubmitField('Registrar')

class LoginForm(FlaskForm):
    email = StringField('Email', validators=[DataRequired()])
    password = PasswordField('Password', validators=[DataRequired()])
    remember_me = BooleanField('Recuérdame')
    submit = SubmitField('Login')

class DeviceForm(FlaskForm):
    name = StringField('Nombre Dispositivo', validators=[DataRequired(), Length(max=64)])
    tipodispositivo = SelectField(u'Tipo de Dispositivo', choices=[('Dispositivo', 'Dispositivo'), ('Objeto', 'Objeto'), ('Persona', 'Persona')])
    macaddress = StringField('macAddress', validators=[DataRequired(), Length(max=36)],render_kw={'class':'selectClass'})
    submit = SubmitField('Agregar')
    
