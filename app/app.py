from flask import Flask, jsonify

app = Flask(__name__)

@app.route("/")
def home():
    return jsonify({
        "message": "DevSecOps Security Pipeline API is running",
        "project": "DevSecOps CI/CD Security Pipeline",
        "status": "success"
    })

@app.route("/health")
def health():
    return jsonify({
        "status": "healthy"
    })

@app.route("/security-status")
def security_status():
    return jsonify({
        "security_scanning": "enabled",
        "docker_scan": "Trivy",
        "terraform_scan": "Checkov",
        "pipeline": "GitHub Actions",
        "status": "ready"
    })

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)