from flask import Flask
import logging
import socket
from pymongo.mongo_client import MongoClient
from flask import Flask, request, jsonify
import re
import pymongo
from datetime import datetime

logger = logging.getLogger(__name__)
app = Flask(__name__)

states = {
    "tryNew": False,
    "oneDayPrior": False,
    "arriveAirport": False,
    "boardingGateConfirmed": False,
    "oneHourPriorBoarding": False,
    "thirtyMinPriorBoarding": False,
    "postFlight": False
}

@app.route("/trynew", methods=["GET"])
def tryNew():
    global states
    states["tryNew"] = not states["tryNew"]
    return "success"

@app.route("/onedayprior", methods=["GET"])
def oneDayPrior():
    global states
    states["oneDayPrior"] = not states["oneDayPrior"]
    return "success"

@app.route("/arriveairport", methods=["GET"])
def arriveAirport():
    global states
    states["arriveAirport"] = not states["arriveAirport"]
    return "success"

@app.route("/boardinggateconfirmed", methods=["GET"])
def boardingGateConfirmed():
    global states
    states["boardingGateConfirmed"] = not states["boardingGateConfirmed"]
    return "success"

@app.route("/onehourpriorboarding", methods=["GET"])
def oneHourPriorBoarding():
    global states
    states["oneHourPriorBoarding"] = not states["oneHourPriorBoarding"]
    return "success"

@app.route("/thirtyminpriorboarding", methods=["GET"])
def thirtyMinPriorBoarding():
    global states
    states["thirtyMinPriorBoarding"] = not states["thirtyMinPriorBoarding"]
    return "success"

@app.route("/postflight", methods=["GET"])
def postFlight():
    global states
    states["postFlight"] = not states["postFlight"]
    return "success"

@app.route("/getstates", methods=["GET"])
def getStates():
    global states
    return jsonify(states)

logger = logging.getLogger()
handler = logging.StreamHandler()
formatter = logging.Formatter(
    '%(asctime)s %(name)-12s %(levelname)-8s %(message)s')
handler.setFormatter(formatter)
logger.addHandler(handler)
logger.setLevel(logging.INFO)

if __name__ == "__main__":
    logging.info("Starting application ...")
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    sock.bind(('localhost', 8080))
    port = sock.getsockname()[1]
    sock.close()
    app.run(port=port)