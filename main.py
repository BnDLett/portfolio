import math
from flask import Flask, render_template, send_file
import datetime

app = Flask(__name__)


def get_age():
    today = datetime.datetime.today().replace(hour=0, minute=0, second=0, microsecond=0)
    date_of_birth = datetime.datetime(2008, 10, 28)
    age = today - date_of_birth

    return age.days / 365


@app.route("/")
def index():
    current_age = math.floor(get_age())
    return render_template("index.html", age=current_age)


# @app.route("/images/thumb")
# def thumb():
#     return send_file("static/thumb.png", mimetype='image/png')


if __name__ == "__main__":
    app.run("0.0.0.0", 8080)
