from flask import Flask, render_template, request

app = Flask(__name__)

@app.route("/")
def home():
    return render_template("index.html", nome="Mestre")

@app.route("/saudacao", methods=["POST"])
def saudacao():
    nome = request.form.get("nome")
    return f"Olá, {nome}! Bem-vindo à sua aplicação Flask."

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
